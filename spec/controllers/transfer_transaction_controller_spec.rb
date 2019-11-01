# typed: false
require 'rails_helper'

RSpec.describe TransferTransactionsController do
  describe 'GET new' do
    it 'renders page successfully' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST create' do
    let(:amount_cents) { 1000 }
    let(:amount_currency) { 'VND' }
    let(:paid_at) { Time.current }
    let(:description) { 'description' }
    let(:params) do
      {
        transaction: {
          amount_currency: amount_currency,
          amount_cents: amount_cents,
          paid_at: paid_at,
          description: description,
          from_account_id: from_account_id,
          to_account_id: to_account_id
        }
      }
    end

    context 'when transactions are successfully created' do
      let(:from_account_id) { create(:account).id }
      let(:to_account_id) { create(:account).id }

      it 'redirects to transactions page' do
        expect {
          post :create, params: params
        }.to change { Transaction.count }.by(2)

        income_transaction = Transaction.find_by(account_id: to_account_id)
        expect(income_transaction.amount_cents).to eq amount_cents
        expect(income_transaction.amount_currency).to eq amount_currency
        expect(income_transaction.description).to eq description
        expect(income_transaction.category_id).to eq Category.income_transfer_category.id
        expect(income_transaction.ignored).to eq true

        expense_transaction = Transaction.find_by(account_id: from_account_id)
        expect(expense_transaction.amount_cents).to eq amount_cents
        expect(expense_transaction.amount_currency).to eq amount_currency
        expect(expense_transaction.description).to eq description
        expect(expense_transaction.category_id).to eq Category.expense_transfer_category.id
        expect(expense_transaction.ignored).to eq true

        expect(response).to redirect_to(transactions_path)
        expect(flash[:notice]).to eq 'Transaction was successfully created.'
      end
    end

    context 'when transactions are not successfully created' do
      let(:from_account_id) { }
      let(:to_account_id) { }

      it 'redirects to transfer page' do
        expect {
          post :create, params: params
        }.not_to change { Transaction.count }
        expect(response).to redirect_to(new_transfer_transaction_path)
        expect(flash[:notice]).to eq 'Validation failed: Account must exist'
      end
    end
  end
end
