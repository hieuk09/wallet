require 'rails_helper'

RSpec.describe Reports::TransactionQuery do
  describe '#execute' do
    let(:account) { create(:account) }
    let(:account_id) { account.id }
    let!(:transaction_1) { create(:transaction, paid_at: Date.new(2018, 2, 3), account_id: account_id) }
    let!(:transaction_2) { create(:transaction, paid_at: Date.new(2018, 2, 4)) }
    let!(:transaction_3) { create(:transaction, paid_at: Date.new(2018, 2, 5)) }
    let(:query) { described_class.new }
    subject { query.execute(params).pluck(:id) }

    context 'when params is all' do
      let(:params) { double('Params', all?: true, account_id: nil) }
      it { is_expected.to match_array([transaction_1.id, transaction_2.id, transaction_3.id]) }
    end

    context 'when params is not all' do
      let(:date_from) { Date.new(2018, 2, 4).beginning_of_day }
      let(:date_to) { Date.new(2018, 2, 4).end_of_day }
      let(:params) do
        double(
          'Params',
          all?: false,
          from: date_from,
          to: date_to,
          account_id: ''
        )
      end
      it { is_expected.to match_array([transaction_2.id]) }
    end

    context 'when params is filtered by account' do
      let(:params) { double('Params', all?: true, account_id: account_id) }
      it { is_expected.to match_array([transaction_1.id]) }
    end
  end
end
