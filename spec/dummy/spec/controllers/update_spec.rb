require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe 'update' do
    subject { patch :update, params: params }
    let(:params) { { id: id, book: book_params } }
    let(:id) { nil }
    let(:book_params) { nil }
    let(:book) { Book.create(title: '11/22/63', author: 'Stephen King') }

    before do
      subject
    end

    context 'when id is wrong' do
      let(:id) { 0 }
      it 'returns 404' do
        expect(response).to have_http_status(404)
      end
    end

    context 'when params are empty' do
      let(:id) { book.id }
      it 'returns 400' do
        expect(response).to have_http_status(400)
      end

      it 'returns errors' do
        expect(response.body).to eq({ errors: { book: ['param is missing'] } }.to_json)
      end
    end

    context 'when there are errors in params' do
      let(:id) { book.id }
      let(:book_params) { { title: 'aa', author: 'bb' } }
      it 'returns 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns errors' do
        expect(response.body).to eq({ errors: { title: ['is too short (minimum is 3 characters)'], author: ['is too short (minimum is 3 characters)'] } }.to_json)
      end
    end

    context 'when everything is ok' do
      let(:id) { book.id }
      let(:book_params) { { title: 'A Song of Ice and Fire', author: 'George R. R. Martin' } }
      it 'returns 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns a book' do
        book.reload
        expect(response.body).to eq({ book: { id: book.id, title: 'A Song of Ice and Fire', author: 'George R. R. Martin', created_at: book.created_at, updated_at: book.updated_at } }.to_json)
      end
    end
  end
end
