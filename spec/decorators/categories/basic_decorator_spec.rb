# typed: false
require 'rails_helper'

RSpec.describe Categories::BasicDecorator do
  describe '#total_usd' do
    let(:exchanged_total) { 12 }
    let(:total) { double('Amount') }
    let(:category) { double('Category', total:) }
    let(:decorator) { described_class.new(category) }
    subject { decorator.total_usd }

    before do
      expect(total).to receive(:exchange_to)
        .with(:usd).and_return(exchanged_total)
    end

    it { is_expected.to eq exchanged_total }
  end

  describe '#<=>' do
    let(:category_1) { double('Category', total: 10, category_type: type_1) }
    let(:category_2) { double('Category', total: 20, category_type: type_2) }
    let(:decorator_1) { described_class.new(category_1) }
    let(:decorator_2) { described_class.new(category_2) }
    let(:array) { [decorator_1, decorator_2] }
    subject { array.sort }

    context 'when category type is the same' do
      let(:type_1) { 'income' }
      let(:type_2) { type_1 }
      it { is_expected.to eq [decorator_1, decorator_2] }
    end

    context 'when category type is not the same' do
      let(:type_1) { 'income' }
      let(:type_2) { 'expense' }
      it { is_expected.to eq [decorator_2, decorator_1] }
    end
  end

  describe '#income?' do
    let(:category) { double('Category', category_type:) }
    let(:decorator) { described_class.new(category) }
    subject { decorator.income? }

    context 'when category type is not income' do
      let(:category_type) { Category::EXPENSE }
      it { is_expected.to eq false }
    end

    context 'when category type is income' do
      let(:category_type) { Category::INCOME }
      it { is_expected.to eq true }
    end
  end

  describe '#expense?' do
    let(:category) { double('Category', category_type:) }
    let(:decorator) { described_class.new(category) }
    subject { decorator.expense? }

    context 'when category type is expense' do
      let(:category_type) { Category::EXPENSE }
      it { is_expected.to eq true }
    end

    context 'when category type is not expense' do
      let(:category_type) { Category::INCOME }
      it { is_expected.to eq false }
    end
  end
end
