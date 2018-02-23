require 'rails_helper'

RSpec.describe Category do
  describe '#total' do
    let(:category) { build_stubbed(:category) }
    subject { category.total }

    context 'when transactions exists' do
      let(:transactions) { double('ActiveRecord::Relation', to_a: [transaction], exists?: true) }
      let(:transaction) { double('Transaction', amount: amount) }
      let(:amount) { Money.new(12, :usd) }

      before do
        expect(category).to receive(:transactions)
          .and_return(transactions)
      end

      it { is_expected.to eq amount }
    end

    context 'when transaction does not exists' do
      it { is_expected.to eq Money.new(0, :vnd) }
    end
  end
end
