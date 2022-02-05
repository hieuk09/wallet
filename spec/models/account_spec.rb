# typed: false
require 'rails_helper'

RSpec.describe Account do
  describe '.assets' do
    subject { Account.assets }

    context 'when there is no account' do
      it 'returns zero balance' do
        expect(subject).to be_a(Money)
        expect(subject.fractional).to eq 0
      end
    end

    context 'when there is account with negative balance' do
      let!(:transaction) do
        create(
          :transaction,
          amount: Money.new(-2000, :vnd),
          account:,
          category:
        )
      end
      let(:category) { create(:category, category_type: Category::INCOME) }
      let(:account) { create(:account, initial_balance: Money.new(1000, :vnd)) }

      it 'returns zero balance' do
        expect(subject).to be_a(Money)
        expect(subject.fractional).to eq 0
      end
    end

    context 'when there is account with positive balance' do
      let(:balance) { Money.new(2000, :vnd) }
      let!(:transaction) do
        create(
          :transaction,
          amount: Money.new(1000, :vnd),
          account:,
          category:
        )
      end
      let(:category) { create(:category, category_type: Category::INCOME) }
      let(:account) { create(:account, initial_balance: Money.new(1000, :vnd)) }
      it { is_expected.to eq balance }
    end
  end

  describe '.liabilities' do
    subject { Account.liabilities }

    context 'when there is no account' do
      it 'returns zero balance' do
        expect(subject).to be_a(Money)
        expect(subject.fractional).to eq 0
      end
    end

    context 'when there is account with negative balance' do
      let(:balance) { Money.new(-1000, :vnd) }
      let!(:transaction) do
        create(
          :transaction,
          amount: Money.new(-2000, :vnd),
          account:,
          category:
        )
      end
      let(:category) { create(:category, category_type: Category::INCOME) }
      let(:account) { create(:account, initial_balance: Money.new(1000, :vnd)) }
      it { is_expected.to eq balance }
    end

    context 'when there is account with positive balance' do
      let(:balance) { Money.new(2000, :vnd) }
      let!(:transaction) do
        create(
          :transaction,
          amount: Money.new(1000, :vnd),
          account:,
          category:
        )
      end
      let(:category) { create(:category, category_type: Category::INCOME) }
      let(:account) { create(:account, initial_balance: Money.new(1000, :vnd)) }

      it 'returns zero balance' do
        expect(subject).to be_a(Money)
        expect(subject.fractional).to eq 0
      end
    end
  end
end
