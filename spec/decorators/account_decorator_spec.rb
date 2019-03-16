require 'rails_helper'

RSpec.describe AccountDecorator do
  describe '#initial_balance' do
    let(:amount) { Money.new(100000, :vnd) }
    let(:account) { double('Account', initial_balance: amount) }
    let(:decorator) { described_class.new(account) }
    subject { decorator.initial_balance }
    it { is_expected.to eq '100,000 VND' }
  end

  describe '#transactions' do
    let(:transaction_decorators) { [double('TransactionDecorator')] }
    let(:list_decorator) { double('TransactionsByDateDecorator', decorate: transaction_decorators) }
    let(:transactions) { [double('Transaction')] }
    let(:account) { double('Account') }
    let(:decorator) { described_class.new(account) }
    subject { decorator.transactions }

    before do
      expect(account).to receive_message_chain(transactions: [], order: [:paid_at])
        .and_return(transactions)
      expect(TransactionsByDateDecorator).to receive(:new)
        .with(transactions).and_return(list_decorator)
    end

    it { is_expected.to eq transaction_decorators }
  end
end
