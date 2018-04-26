require 'rails_helper'

RSpec.describe AccountsController do
  describe 'GET show' do
    let(:account) { create(:account) }

    it 'renders account page' do
      get :show, params: { id: account.id }
      expect(response).to be_successful
    end
  end
end
