# typed: false

require 'rails_helper'

RSpec.describe PdfExtractor do
  describe '#extract' do
    let(:text) do
      <<-TEXT
       Account

       21 Jul           Debit Card Transaction                                      14.80
                        THE GREEN PARTY    SI NG
                        xxxx-xxxx-xxxx-xxxx

       21 Jul           Debit Card Transaction                                                    60.00
                        TOYS'R'US (S) PL - SUN SI NG 19JUL
                        xxxx-xxxx-xxxx-xxxx

      TEXT
    end
    let(:pages) { [double(text:)] }
    let(:reader) { instance_double(PDF::Reader, pages:) }
    let(:io) { double }
    let(:extractor) { described_class.new }
    let(:expected_transactions) do
      [
        {
          deposit: nil,
          description: 'THE GREN PARTY SI NG x-x-x-x',
          paid_at: DateTime.new(Date.current.year, 7, 21),
          withdrawal: BigDecimal('14.80')
        },
        {
          deposit: BigDecimal('60'),
          description: "TOYS'R'US (S) PL - SUN SI NG 19JUL x-x-x-x",
          paid_at: DateTime.new(Date.current.year, 7, 19),
          withdrawal: nil
        }
      ]
    end
    subject { extractor.extract(io) }

    before do
      expect(PDF::Reader).to receive(:new)
        .with(io).and_return(reader)
    end

    it { is_expected.to eq expected_transactions }
  end
end
