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

  describe '#file_name' do
    let(:current) { Date.new(2018, 3, 4) }
    let(:type) { described_class.new(params, current) }
    subject { type.file_name }

    context 'when params has month' do
      let(:params) { { 'date(2i)' => '2' } }
      it { is_expected.to eq '2-2018.csv' }
    end

    context 'when params has year' do
      let(:params) { { 'date(1i)' => '2017' } }
      it { is_expected.to eq '3-2017.csv' }
    end

    context 'when params has both' do
      let(:params) { { 'date(1i)' => '2017', 'date(2i)' => '2' } }
      it { is_expected.to eq '2-2017.csv' }
    end

    context 'when params has none' do
      let(:params) { {} }
      it { is_expected.to eq '3-2018.csv' }
    end
  end

  describe '#empty?' do
    subject { described_class.new(params).empty? }

    context 'when params is empty' do
      let(:params) { {} }
      it { is_expected.to eq true }
    end

    context 'when params is not empty' do
      let(:params) { { 'date(2i)' => '2' } }
      it { is_expected.to eq false }
    end
  end
end
