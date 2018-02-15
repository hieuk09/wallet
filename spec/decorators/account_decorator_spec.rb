require 'rails_helper'

RSpec.describe AccountDecorator do
  describe '#initial_balance' do
    let(:amount) { Money.new(100000, :vnd) }
    let(:account) { double('Account', initial_balance: amount) }
    let(:decorator) { described_class.new(account) }
    subject { decorator.initial_balance }
    it { is_expected.to eq '100,000 ₫' }
  end

  describe '#transactions' do
    let(:transactions) { [double('Transaction')] }
    let(:account) { double('Account', transactions: transactions) }
    let(:decorator) { described_class.new(account) }
    subject { decorator.transactions }

    it 'returns a list of transaction decorators' do
      expect(subject.count).to eq 1
      expect(subject.first).to be_a(TransactionDecorator)
    end
  end
end
