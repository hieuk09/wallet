require 'rails_helper'

RSpec.describe TransactionsController do
  describe 'GET index' do
    it 'gets all transactions' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'POST ignore' do
    let(:id) { 1 }
    let(:transaction) { double }

    before do
      expect(Transaction).to receive(:find)
        .with(id.to_s).and_return(transaction)
      expect(transaction).to receive(:ignore)
        .and_return(can_ignore)
    end

    context 'when transaction can be ignored' do
      let(:can_ignore) { true }

      it 'redirects and renders notice' do
        post :ignore, params: { id: id }
        expect(response).to redirect_to(transactions_url)
        expect(flash[:notice]).to eq 'Transaction was successfully ignored.'
      end
    end

    context 'when transaction can not be ignored' do
      let(:can_ignore) { false }

      it 'redirects and renders error' do
        expect(transaction).to receive_message_chain(:errors, :full_messages)
          .and_return(['error'])
        post :ignore, params: { id: id }
        expect(response).to redirect_to(transactions_url)
        expect(flash[:alert]).to eq 'error'
      end
    end
  end

  describe 'GET new' do
    context 'when id is specified' do
      let(:transaction) { create(:transaction) }

      it 'renders copied transaction' do
        get :new, params: { id: transaction.id }
        expect(response).to be_successful
      end
    end

    context 'when id is not specified' do
      it 'renders new transaction' do
        get :new
        expect(response).to be_successful
      end
    end
  end
end
