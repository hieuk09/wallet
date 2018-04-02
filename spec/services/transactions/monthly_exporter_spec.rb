require 'rails_helper'

RSpec.describe Transactions::MonthlyExporter do
  describe '#generate' do
    let(:category) { create(:category, category_type: 'expense', name: 'Name') }
    let(:account) { create(:account, name: 'account name') }
    let!(:transaction) do
      create(
        :transaction,
        category: category,
        account: account,
        paid_at: DateTime.new(2018, 2, 3, 10, 12, 30),
        amount: Money.new(12000, :vnd),
        description: 'description'
      )
    end
    let(:exporter) { described_class.new(Transaction.all) }
    subject { exporter.generate }
    it { is_expected.to eq "Paid at,Category,Category type,Account,Amount,Description\n2018-02-03,Name,expense,account name,12000,description\n" }
  end
end
