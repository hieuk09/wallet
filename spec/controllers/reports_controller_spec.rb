# typed: false
require 'rails_helper'

RSpec.describe ReportsController, type: :controller do
  describe 'GET transactions' do
    it 'renders successfully' do
      get :transactions
      expect(response).to be_successful
    end
  end
end
