# typed: false
require 'rails_helper'

RSpec.describe CategoriesController do
  describe 'GET index' do
    it 'renders correct data' do
      get :index
      expect(response).to be_successful
    end
  end
end
