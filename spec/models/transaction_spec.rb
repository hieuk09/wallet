# typed: false
require 'rails_helper'

RSpec.describe Transaction do
  describe '#recalculate_amount' do
    let!(:income_category) { create(:category, :income) }
    let!(:expense_category) { create(:category, :expense) }
    let!(:income_transaction) do
      create(
        :sub_transaction,
        transaction_id: transaction.id,
        category: income_category,
        amount: Money.new(1000, :vnd)
      )
    end
    let!(:expense_transaction) do
      create(
        :sub_transaction,
        transaction_id: transaction.id,
        category: expense_category,
        amount: Money.new(1500, :vnd)
      )
    end

    context 'when transaction is expense' do
      let(:transaction) { create(:transaction, category: expense_category) }

      it 'updates transaction' do
        expect {
          transaction.recalculate_amount
        }.to change { transaction.reload.amount.to_i }
          .from(0).to(500)
      end
    end

    context 'when transaction is income' do
      let(:transaction) { create(:transaction, category: income_category) }

      it 'updates transaction' do
        expect {
          transaction.recalculate_amount
        }.to change { transaction.reload.amount.to_i }
          .from(0).to(-500)
      end
    end
  end

  describe '#ignore' do
    let(:transaction) { create(:transaction) }

    it 'ignores transaction' do
      expect {
        transaction.ignore
      }.to change { transaction.ignored }
        .from(false).to(true)
    end
  end
end
