require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe 'create' do
    subject { post :create, params: params }
    let(:book) { Book.last }
    let(:params) { {} }

    before do
      subject
    end

    context 'when params are empty' do
      it 'returns 400' do
        expect(response).to have_http_status(400)
      end

      it 'returns errors' do
        expect(response.body).to eq({ errors: { book: ['param is missing'] } }.to_json)
      end
    end

    context 'when there are errors in params' do
      let(:params) { { book: { something: 3 } } }
      it 'returns 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns errors' do
        expect(response.body).to eq({ errors: { title: ["can't be blank", 'is too short (minimum is 3 characters)'], author: ["can't be blank", 'is too short (minimum is 3 characters)'] } }.to_json)
      end
    end

    context 'when everything is ok' do
      let(:params) { { book: attributes_for(:book) } }
      it 'returns 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns a book' do
        expect(response.body).to eq({ book: { id: book.id, title: params[:book][:title], author: params[:book][:author], created_at: book.created_at, updated_at: book.updated_at } }.to_json)
      end
    end
  end
end
