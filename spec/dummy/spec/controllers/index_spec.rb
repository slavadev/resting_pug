require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe 'index' do
    subject { get :index, params: params }
    let(:params) { {} }
    let!(:books) { create_list :book, 25 }

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
          expect(response.body).to eq({ books: [] }.to_json)
        end
      end

      context 'when there are books' do
        it 'returns an array of books' do
          expect(response.body).to eq({ books: books.last(10).reverse }.to_json)
        end
      end
    end

    context 'pagination' do
      context 'per_page specs' do
        context 'per_page param' do
          let(:params) { { per_page: 5 } }

          it 'returns an 5 books' do
            expect(response.body).to eq({ books: books.last(5).reverse }.to_json)
          end
        end

        context 'per_page_default' do
          subject do
            allow(controller).to receive(:per_page_default).and_return(5)
            get :index, params: params
          end

          it 'returns an 5 books' do
            expect(response.body).to eq({ books: books.last(5).reverse }.to_json)
          end
        end

        context 'per_page_range' do
          subject do
            allow(controller).to receive(:per_page_range).and_return({ min: 5, max: 7})
            get :index, params: params
          end

          context 'when per_page is less than minimum' do
            let(:params) { { per_page: 3 } }

            it 'returns an 5 books' do
              expect(response.body).to eq({ books: books.last(5).reverse }.to_json)
            end
          end

          context 'when per_page is more than maximum' do
            let(:params) { { per_page: 30 } }

            it 'returns an 7 books' do
              expect(response.body).to eq({ books: books.last(7).reverse }.to_json)
            end
          end
        end
      end

      context 'page specs' do
        let(:params) { { page: 3, per_page: 5 } }

        it 'returns 3rd page' do
          expect(response.body).to eq({ books: books[10..14].reverse }.to_json)
        end
      end
    end

    context 'sorting' do
      context 'basic sorting' do
        let(:params) { { per_page: 25, sort: '-author,title' } }

        it 'returns books sorted in the right way' do
          expect(response.body).to eq({ books: books.sort{|x,y| x.author == y.author ? x.title <=> y.title : y.author <=> x.author} }.to_json)
        end
      end

      context 'default sorting' do
        subject do
          expect(controller).to receive(:default_sort_params).and_return({ author: :desc })
          get :index, params: params
        end

        let(:params) { { per_page: 25 } }

        it 'returns books sorted in the right way' do
          expect(response.body).to eq({ books: books.sort{|x,y| y.author <=> x.author} }.to_json)
        end
      end

      context 'when permitted_fields_for_sort is not default' do
        subject do
          expect(controller).to receive(:permitted_fields_for_sort).and_return([:title])
          get :index, params: params
        end

        let(:params) { { per_page: 25, sort: 'author' } }

        it 'returns books sorted in the right way' do
          expect(response.body).to eq({ books: books.sort{|x,y| y.id <=> x.id} }.to_json)
        end
      end
    end
  end
end
