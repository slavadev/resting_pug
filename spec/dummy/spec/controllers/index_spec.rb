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
  end
end
