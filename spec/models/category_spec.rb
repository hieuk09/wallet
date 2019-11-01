# typed: false
require 'rails_helper'

RSpec.describe Category do
  describe '.expense_transfer_category' do
    it 'returns correct category' do
      category = described_class.expense_transfer_category
      expect(category.name).to eq described_class::TRANSFER
      expect(category.category_type).to eq described_class::EXPENSE
    end
  end

  describe '.income_transfer_category' do
    it 'returns correct category' do
      category = described_class.income_transfer_category
      expect(category.name).to eq described_class::TRANSFER
      expect(category.category_type).to eq described_class::INCOME
    end
  end

  describe '#total' do
    let(:category) { create(:category) }
    subject { category.total }

    context 'when transactions exists' do
      let!(:transaction) { create(:transaction, category_id: category.id, amount_cents: 12, amount_currency: :usd) }
      let(:amount) { Money.new(12, :usd) }
      it { is_expected.to eq amount }
    end

    context 'when transaction is ignored' do
      let!(:transaction) { create(:transaction, :ignored, category_id: category.id, amount_cents: 12, amount_currency: :usd) }
      it { is_expected.to eq Money.new(0, :vnd) }
    end

    context 'when transaction does not exists' do
      it { is_expected.to eq Money.new(0, :vnd) }
    end
  end
end
