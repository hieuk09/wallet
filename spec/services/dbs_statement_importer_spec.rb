# typed: false
require 'rails_helper'

RSpec.describe DbsStatementImporter do
  let(:pdf_extractor) { instance_double(PdfExtractor) }
  let(:importer) { described_class.new(pdf_extractor:) }

  describe '#import' do
    let(:file) { double(read: 'data', original_filename: 'file.pdf') }
    let(:account_id) { create(:account).id }
    subject { importer.import(file, account_id) }

    before do
      expect(pdf_extractor).to receive(:extract)
        .and_return(transactions)
    end

    context 'when there are invalid transactions' do
      let(:transactions) { [{}] }

      it 'raises error' do
        expect { subject }.to raise_error('Invalid transaction')
      end
    end

    context 'when there are no invalid transactions' do
      let(:transactions) do
        [
          {
            withdrawal: 1000,
            description: 'Description 1',
            paid_at: Time.now
          },
          {
            deposit: 2000,
            description: 'Description 2',
            paid_at: Time.now
          }
        ]
      end

      before do
        create(:category, :expense)
        create(:category, :income)
      end

      it 'creates import' do
        expect { subject }.to change { Import.count }.by(1)

        import = Import.last
        expect(import.name).to eq 'file.pdf'
      end

      it 'creates transactions' do
        expect { subject }.to change { ImportTransaction.count }.by(2)

        import = Import.last
        expect(ImportTransaction.pluck(:amount_cents)).to match_array [100000, 200000]
        expect(ImportTransaction.pluck(:description)).to match_array ['Description 1', 'Description 2']
        expect(ImportTransaction.pluck(:import_id)).to eq [import.id, import.id]
      end
    end
  end
end
