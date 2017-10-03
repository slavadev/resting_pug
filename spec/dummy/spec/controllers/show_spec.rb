require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe 'show' do
    subject { get :show, params: params }
    let(:params) { { id: id } }
    let(:id) { nil }
    let(:book) { create :book }

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
        expect(json_response).to eq({
          book:
          {
            id: book.id,
            title: book.title,
            author: book.author,
            year: book.year,
            rating: book.rating,
            created_at: book.created_at.as_json,
            updated_at: book.updated_at.as_json
          }
        })
      end
    end

    context 'when permitted_fields_for_show is not default' do
      subject do
        expect(controller).to receive(:permitted_fields_for_show).and_return([:id, :title, :author])
        get :show, params: params
      end

      let(:id) { book.id }

      it 'returns 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns a book only with permitted fields' do
        expect(json_response).to eq({
          book:
          {
            id: book.id,
            title: book.title,
            author: book.author
          }
        })
      end
    end
  end
end
