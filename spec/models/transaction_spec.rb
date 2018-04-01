require 'rails_helper'

RSpec.describe Transaction do
  describe '#ignore' do
    let(:transaction) { create(:transaction) }

    it 'ignores transaction' do
      expect {
        transaction.ignore
      }.to change { transaction.ignored }
        .from(false).to(true)
    end
  end
end
