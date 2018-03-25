require 'rails_helper'

RSpec.describe CategoriesController do
  describe 'GET index' do
    it 'renders correct data' do
      get :index
      expect(response).to be_success
      expect(assigns[:decorator]).to be_a(Categories::SummaryDecorator)
    end
  end
end
