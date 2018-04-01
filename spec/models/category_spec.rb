require 'rails_helper'

RSpec.describe Category do
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
