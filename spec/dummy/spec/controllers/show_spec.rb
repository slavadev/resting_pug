require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe 'show' do
    subject { get :show, params: params }
    let(:params) { { id: id } }
    let(:id) { nil }
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

    context 'when everything is ok' do
      let(:id) { book.id }
      it 'returns 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns a book' do
        expect(response.body).to eq({ book: { id: book.id, title: '11/22/63', author: 'Stephen King', created_at: book.created_at, updated_at: book.updated_at } }.to_json)
      end
    end
  end
end
