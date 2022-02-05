# typed: false
require 'rails_helper'

RSpec.describe SubTransactionsController do
  describe 'POST create' do
    let(:amount) { 1000 }
    let(:transaction) { create(:transaction, amount_cents: amount) }

    context 'when sub transaction cannot be saved' do
      let(:sub_transaction) { {} }
      let(:params) { { transaction_id: transaction.id, sub_transaction: } }

      it 'renders new' do
        expect {
          post :create, params:
        }.not_to change { SubTransaction.count }

        expect(transaction.reload.amount_cents).to eq amount
        expect(response).to be_successful
      end
    end

    context 'when there are errors when recalculate transaction amount' do
      let(:sub_amount) { 2000 }
      let(:category) { create(:category) }
      let(:sub_transaction) { { amount_cents: sub_amount, category_id: category.id } }
      let(:params) { { transaction_id: transaction.id, sub_transaction: } }

      before do
        expect_any_instance_of(Transaction).to receive(:recalculate_amount)
          .and_raise('error')
      end

      it 'renders new' do
        expect {
          post :create, params:
        }.not_to change { SubTransaction.count }

        expect(transaction.reload.amount_cents).to eq amount
        expect(response).to be_successful
      end
    end

    context 'otherwise' do
      let(:sub_amount) { 2000 }
      let(:category) { create(:category) }
      let(:sub_transaction) { { amount_cents: sub_amount, category_id: category.id } }
      let(:params) { { transaction_id: transaction.id, sub_transaction: } }

      it 'renders new' do
        expect {
          post :create, params:
        }.to change { SubTransaction.count }.by(1)

        expect(transaction.reload.amount_cents).to eq sub_amount
        expect(response).to redirect_to(transaction_path(transaction.id))
      end
    end
  end

  describe 'PUT update' do
    let(:amount) { 1000 }
    let(:transaction) { create(:transaction, amount_cents: amount) }
    let(:sub_transaction) { create(:sub_transaction, parent_transaction: transaction, amount_cents: amount) }

    context 'when sub transaction cannot be saved' do
      let(:sub_transaction_params) { { category_id: nil } }
      let(:params) do
        {
          transaction_id: transaction.id,
          sub_transaction: sub_transaction_params,
          id: sub_transaction.id
        }
      end

      it 'renders new' do
        expect {
          put :update, params:
        }.not_to change { sub_transaction.reload.amount }

        expect(transaction.reload.amount_cents).to eq amount
        expect(response).to be_successful
      end
    end

    context 'when there are errors when recalculate transaction amount' do
      let(:sub_amount) { 2000 }
      let(:category) { create(:category) }
      let(:sub_transaction_params) { { amount_cents: sub_amount, category_id: category.id } }
      let(:params) do
        {
          transaction_id: transaction.id,
          sub_transaction: sub_transaction_params,
          id: sub_transaction.id
        }
      end

      before do
        expect_any_instance_of(Transaction).to receive(:recalculate_amount)
          .and_raise('error')
      end

      it 'renders new' do
        expect {
          put :update, params:
        }.not_to change { sub_transaction.reload.amount }

        expect(transaction.reload.amount_cents).to eq amount
        expect(response).to be_successful
      end
    end

    context 'otherwise' do
      let(:sub_amount) { 2000 }
      let(:category) { create(:category) }
      let(:sub_transaction_params) { { amount_cents: sub_amount, category_id: category.id } }
      let(:params) do
        {
          transaction_id: transaction.id,
          sub_transaction: sub_transaction_params,
          id: sub_transaction.id
        }
      end

      it 'renders new' do
        expect {
          put :update, params:
        }.to change { sub_transaction.reload.amount_cents }
          .from(amount).to(sub_amount)

        expect(transaction.reload.amount_cents).to eq sub_amount
        expect(response).to be_successful
      end
    end
  end
end
