# typed: false

require 'rails_helper'

RSpec.describe ImportsController do
  describe 'GET index' do
    it 'renders correct data' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET show' do
    context 'when import is present' do
      let(:import) { create(:import) }

      it 'renders correct data' do
        get :show, params: { id: import.id }
        expect(response).to be_successful
      end
    end

    context 'when import does not exist' do
      it 'raises error' do
        expect {
          get :show, params: { id: -1 }
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe 'GET new' do
    it 'renders correct data' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'DELETE destroy' do
    context 'when id is invalid' do
      it 'does not raise error' do
        expect {
          delete :destroy, params: { id: -1 }
          expect(response).to redirect_to imports_path
        }.not_to change { Import.count }
      end
    end

    context 'when id is valid' do
      let!(:import) { create(:import) }

      it 'destroys import record' do
        expect {
          delete :destroy, params: { id: import.id }
          expect(response).to redirect_to imports_path
        }.to change { Import.count }.by(-1)
      end
    end
  end
end
