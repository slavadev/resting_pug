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
          expect(response.body).to eq({ books: books.first(10) }.to_json)
        end
      end
    end

    context 'pagination' do
      context 'per_page specs' do
        context 'per_page param' do
          let(:params) { { per_page: 5 } }

          it 'returns an 5 books' do
            expect(response.body).to eq({ books: books.first(5) }.to_json)
          end
        end

        context 'per_page_default' do
          subject do
            allow(controller).to receive(:per_page_default).and_return(5)
            get :index, params: params
          end

          it 'returns an 5 books' do
            expect(response.body).to eq({ books: books.first(5) }.to_json)
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
              expect(response.body).to eq({ books: books.first(5) }.to_json)
            end
          end

          context 'when per_page is more than maximum' do
            let(:params) { { per_page: 30 } }

            it 'returns an 7 books' do
              expect(response.body).to eq({ books: books.first(7) }.to_json)
            end
          end
        end
      end

      context 'page specs' do
        let(:params) { { page: 3, per_page: 5 } }

        it 'returns 3rd page' do
          expect(response.body).to eq({ books: books[10..14] }.to_json)
        end
      end
    end
  end
end
