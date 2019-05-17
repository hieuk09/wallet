require 'rails_helper'

RSpec.describe ExportParams do
  describe '#from' do
    let(:current) { Date.new(2018, 3, 4) }
    let(:type) { described_class.new(params, current) }
    subject { type.from }

    context 'when params has month' do
      let(:params) { { 'date(2i)' => '2' } }
      it { is_expected.to eq DateTime.new(2018, 2, 1, 0, 0, 0) }
    end

    context 'when params has year' do
      let(:params) { { 'date(1i)' => '2017' } }
      it { is_expected.to eq DateTime.new(2017, 3, 1, 0, 0, 0) }
    end

    context 'when params has both' do
      let(:params) { { 'date(1i)' => '2017', 'date(2i)' => '2' } }
      it { is_expected.to eq DateTime.new(2017, 2, 1, 0, 0, 0) }
    end

    context 'when params has none' do
      let(:params) { {} }
      it { is_expected.to eq DateTime.new(2018, 3, 1, 0, 0, 0) }
    end
  end

  describe '#to' do
    let(:current) { Date.new(2018, 3, 4) }
    let(:type) { described_class.new(params, current) }
    subject { type.to }

    context 'when params has month' do
      let(:params) { { 'date(2i)' => '2' } }
      it { is_expected.to eq DateTime.new(2018, 2, 28).end_of_day }
    end

    context 'when params has year' do
      let(:params) { { 'date(1i)' => '2017' } }
      it { is_expected.to eq DateTime.new(2017, 3, 31).end_of_day }
    end

    context 'when params has both' do
      let(:params) { { 'date(1i)' => '2017', 'date(2i)' => '2' } }
      it { is_expected.to eq DateTime.new(2017, 2, 28).end_of_day }
    end

    context 'when params has none' do
      let(:params) { {} }
      it { is_expected.to eq DateTime.new(2018, 3, 31).end_of_day }
    end
  end

  describe '#all?' do
    subject { described_class.new(params).all? }

    context 'when params is all' do
      let(:params) { { 'all' => true } }
      it { is_expected.to eq true }
    end

    context 'when params is not all' do
      let(:params) { { 'all' => false } }
      it { is_expected.to eq false }
    end
  end
end
