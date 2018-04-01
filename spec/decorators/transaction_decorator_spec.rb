require 'rails_helper'

RSpec.describe TransactionDecorator do
  describe '#amount_format' do
    let(:amount) { Money.new(100000, :vnd) }
    let(:transaction) { double('Transaction', amount: amount) }
    let(:decorator) { described_class.new(transaction) }
    subject { decorator.amount_format }
    it { is_expected.to eq '100,000 ₫' }
  end

  describe '#paid_at' do
    let(:time) { Date.new(2017, 3, 4) }
    let(:transaction) { double('Transaction', paid_at: time) }
    let(:decorator) { described_class.new(transaction) }
    subject { decorator.paid_at }
    it { is_expected.to eq '2017-03-04' }
  end

  describe '#category_type' do
    let(:decorator) { described_class.new(transaction) }
    subject { decorator.category_type }

    context 'when transaction is ignored' do
      let(:transaction) { double('Transaction', ignored?: true) }
      it { is_expected.to eq 'ignored' }
    end

    context 'when transaction is not ignored' do
      let(:category_type) { 'category_type' }
      let(:transaction) do
        double(
          'Transaction',
          ignored?: false,
          category: double('Category', category_type: category_type)
        )
      end
      it { is_expected.to eq category_type }
    end
  end
end
