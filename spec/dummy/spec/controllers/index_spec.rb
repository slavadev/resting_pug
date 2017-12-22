require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe 'index' do
    subject { get :index, params: params }
    let(:params) { {} }
    let!(:books) { create_list :book, 25 }
    let(:response_json) {
      {
        books: response_books,
        total_pages: total_pages,
        total_entries: total_entries,
        current_page: current_page,
        per_page: response_per_page
      }.to_json
    }
    let(:response_books) { [] }
    let(:total_pages) { 1 }
    let(:total_entries) { 0 }
    let(:current_page) { 1 }
    let(:response_per_page) { 10 }

    before do
      subject
    end

    context 'when everything is ok' do
      it 'returns 200' do
        expect(response).to have_http_status(200)
      end

      context 'when there are no books' do
        let!(:books) { nil }
        it 'returns an empty array' do
          expect(response.body).to eq(response_json)
        end
      end

      context 'when there are books' do
        let(:response_books) { books.last(10).reverse }
        let(:total_pages) { 3 }
        let(:total_entries) { 25 }

        it 'returns an array of books' do
          expect(response.body).to eq(response_json)
        end
      end
    end

    context 'pagination' do
      context 'per_page specs' do
        context 'per_page param' do
          let(:params) { { per_page: 5 } }
          let(:response_books) { books.last(5).reverse }
          let(:total_pages) { 5 }
          let(:total_entries) { 25 }
          let(:response_per_page) { 5 }

          it 'returns an 5 books' do
            expect(response.body).to eq(response_json)
          end
        end

        context 'per_page_default' do
          subject do
            allow(controller).to receive(:per_page_default).and_return(5)
            get :index, params: params
          end

          let(:response_books) { books.last(5).reverse }
          let(:total_pages) { 5 }
          let(:total_entries) { 25 }
          let(:response_per_page) { 5 }

          it 'returns an 5 books' do
            expect(response.body).to eq(response_json)
          end
        end

        context 'per_page_range' do
          subject do
            allow(controller).to receive(:per_page_range).and_return({ min: 5, max: 7})
            get :index, params: params
          end

          context 'when per_page is less than minimum' do
            let(:params) { { per_page: 3 } }

            let(:response_books) { books.last(5).reverse }
            let(:total_pages) { 5 }
            let(:total_entries) { 25 }
            let(:response_per_page) { 5 }

            it 'returns an 5 books' do
              expect(response.body).to eq(response_json)
            end
          end

          context 'when per_page is more than maximum' do
            let(:params) { { per_page: 30 } }

            let(:response_books) { books.last(7).reverse }
            let(:total_pages) { 4 }
            let(:total_entries) { 25 }
            let(:response_per_page) { 7 }

            it 'returns an 7 books' do
              expect(response.body).to eq(response_json)
            end
          end
        end
      end

      context 'page specs' do
        let(:params) { { page: 3, per_page: 5 } }

        let(:response_books) { books[10..14].reverse }
        let(:total_pages) { 5 }
        let(:total_entries) { 25 }
        let(:response_per_page) { 5 }
        let(:current_page) { 3 }

        it 'returns 3rd page' do
          expect(response.body).to eq(response_json)
        end
      end
    end

    context 'sorting' do
      context 'basic sorting' do
        let(:params) { { per_page: 25, sort: '-author,title' } }

        let(:response_books) { books.sort{ |x,y| x.author == y.author ? x.title <=> y.title : y.author <=> x.author } }
        let(:total_entries) { 25 }
        let(:response_per_page) { 25 }

        it 'returns books sorted in the right way' do
          expect(response.body).to eq(response_json)
        end
      end

      context 'default sorting' do
        subject do
          expect(controller).to receive(:default_sort_params).and_return({ author: :desc })
          get :index, params: params
        end

        let(:params) { { per_page: 25 } }

        let(:response_books) { books.sort{ |x,y| y.author <=> x.author } }
        let(:total_entries) { 25 }
        let(:response_per_page) { 25 }

        it 'returns books sorted in the right way' do
          expect(response.body).to eq(response_json)
        end
      end

      context 'when permitted_fields_for_sort is not default' do
        subject do
          expect(controller).to receive(:permitted_fields_for_sort).and_return([:title])
          get :index, params: params
        end

        let(:params) { { per_page: 25, sort: 'author' } }

        let(:response_books) { books.sort{ |x,y| y.id <=> x.id } }
        let(:total_entries) { 25 }
        let(:response_per_page) { 25 }

        it 'returns books sorted in the right way' do
          expect(response.body).to eq(response_json)
        end
      end
    end

    context 'filtering' do
      let!(:book) { create :book, title: 'Not real title', author: 'Not real author' }
      let!(:another_book) { create :book, title: 'Not real title', author: 'Another author' }

      context 'filtering by one param' do
        let(:params) { { filter: { title: 'Not real title' } } }
        context 'when param is in the permitted list' do
          subject do
            allow(controller).to receive(:permitted_fields_for_filter).and_return([:title])
            book; another_book
            get :index, params: params
          end

          let(:response_books) { [another_book, book] }
          let(:total_entries) { 2 }

          it 'returns filtered books' do
            expect(response.body).to eq(response_json)
          end
        end

        context 'when param is not in the permitted list' do
          subject do
            allow(controller).to receive(:permitted_fields_for_filter).and_return([:author])
            book; another_book
            get :index, params: params
          end

          let(:response_books) { [another_book, book] + books.reverse.first(8) }
          let(:total_entries) { 27 }
          let(:total_pages) { 3 }

          it 'returns all books' do
            expect(response.body).to eq(response_json)
          end
        end
      end

      context 'filtering by array' do
        let(:params) { { filter: { author: ['Not real author', 'Another author'] } } }
        context 'when param is in the permitted list' do
          subject do
            allow(controller).to receive(:permitted_fields_for_filter).and_return([:author])
            book; another_book
            get :index, params: params
          end

          let(:response_books) { [another_book, book] }
          let(:total_entries) { 2 }

          it 'returns filtered books' do
            expect(response.body).to eq(response_json)
          end
        end

        context 'when param is not in the permitted list' do
          subject do
            allow(controller).to receive(:permitted_fields_for_filter).and_return([:title])
            book; another_book
            get :index, params: params
          end

          let(:response_books) { [another_book, book] + books.reverse.first(8) }
          let(:total_entries) { 27 }
          let(:total_pages) { 3 }

          it 'returns all books' do
            expect(response.body).to eq(response_json)
          end
        end
      end


      context 'filtering by multiple params' do
        let(:params) { { filter: { title: 'Not real title', author: 'Not real author' } } }
        context 'when params is in the permitted list' do
          subject do
            allow(controller).to receive(:permitted_fields_for_filter).and_return([:title, :author])
            book; another_book
            get :index, params: params
          end

          let(:response_books) { [book] }
          let(:total_entries) { 1 }

          it 'returns filtered books' do
            expect(response.body).to eq(response_json)
          end
        end

        context 'when one param is not in the permitted list' do
          subject do
            allow(controller).to receive(:permitted_fields_for_filter).and_return([:title])
            book; another_book
            get :index, params: params
          end

          let(:response_books) { [another_book, book] }
          let(:total_entries) { 2 }

          it 'returns filtered books for one param' do
            expect(response.body).to eq(response_json)
          end
        end
      end
    end
  end
end
