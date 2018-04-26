require 'rails_helper'

RSpec.describe ExportsController do
  describe 'GET new' do
    it 'responses successfully' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST create' do
    let(:data) { 'data' }
    let(:exporter) { instance_double('Transactions::MonthlyExporter', generate: data) }

    it 'returns the file' do
      expect(Transactions::MonthlyExporter).to receive(:new)
        .with(anything).and_return(exporter)
      post :create, params: { export: { 'date(2i)' => '12' } }
      expect(response.body).to eq data
    end
  end
end
