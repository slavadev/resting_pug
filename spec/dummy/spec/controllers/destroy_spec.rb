require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe 'destroy' do
    subject { delete :destroy, params: params }
    let(:params) { { id: id } }
    let(:id) { nil }
    let(:book) { Book.create(title: 'title', author: 'author') }

    before do
      subject
    end

    context 'when id is wrong' do
      let(:id) { 0 }
      it 'returns 404' do
        expect(response).to have_http_status(404)
      end
    end

    context 'when destroy return errors' do
      let(:id) { book.id }

      subject do
        doubled_book = double(:book)
        allow(doubled_book).to receive(:destroy).and_return(false)
        allow(doubled_book).to receive(:errors).and_return({ some: 'error' })
        allow_any_instance_of(BooksController).to receive_message_chain(:subject_model, :find).and_return(doubled_book)
        delete :destroy, params: params
      end

      it 'returns 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns errors' do
        expect(response.body).to eq({ errors: { some: 'error' } }.to_json)
      end
    end

    context 'when everything is ok' do
      let(:id) { book.id }

      it 'returns 204' do
        expect(response).to have_http_status(204)
      end

      it 'returns nothing' do
        expect(response.body).to eq('{}')
      end

      it 'destroys the book' do
        expect{ book.reload }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
