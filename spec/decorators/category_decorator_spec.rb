require 'rails_helper'

RSpec.describe CategoryDecorator do
  describe '#total' do
    let(:amount) { Money.new(100000, :vnd) }
    let(:category) { double('Category', total: amount) }
    let(:decorator) { described_class.new(category) }
    subject { decorator.total }
    it { is_expected.to eq '100,000 ₫' }
  end

  describe '#transactions' do
    let(:transaction_decorators) { [double('TransactionDecorator')] }
    let(:list_decorator) { double('TransactionsByDateDecorator', decorate: transaction_decorators) }
    let(:transactions) { [double('Transaction')] }
    let(:category) { double('Category', transactions: transactions) }
    let(:decorator) { described_class.new(category) }
    subject { decorator.transactions }

    before do
      expect(TransactionsByDateDecorator).to receive(:new)
        .with(transactions).and_return(list_decorator)
    end

    it { is_expected.to eq transaction_decorators }
  end
end
