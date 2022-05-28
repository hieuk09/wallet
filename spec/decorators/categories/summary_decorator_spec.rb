# typed: false

require 'rails_helper'

RSpec.describe Categories::SummaryDecorator do
  describe '#income_data' do
    let(:scope) { [] }
    let(:decorator) { described_class.new(scope) }
    let(:category_1) { double('Category', income?: false, total_usd: 10, name: 'category 1') }
    let(:category_2) { double('Category', income?: true, total_usd: 10, name: 'category 2') }
    let(:categories) { [category_1, category_2] }
    subject { decorator.income_data }

    before do
      expect(decorator).to receive(:all_categories)
        .and_return(categories)
    end

    it { is_expected.to eq('category 2' => 10) }
  end

  describe '#expense_data' do
    let(:scope) { [] }
    let(:decorator) { described_class.new(scope) }
    let(:category_1) { double('Category', expense?: true, total_usd: 10, name: 'category 1') }
    let(:category_2) { double('Category', expense?: false, total_usd: 10, name: 'category 2') }
    let(:categories) { [category_1, category_2] }
    subject { decorator.expense_data }

    before do
      expect(decorator).to receive(:all_categories)
        .and_return(categories)
    end

    it { is_expected.to eq('category 1' => 10) }
  end

  describe '#all_categories' do
    let(:category_1) { double('Category', total: 20, category_type: 'income') }
    let(:category_2) { double('Category', total: 10, category_type: 'income') }
    let(:scope) { [category_1, category_2] }
    let(:decorator) { described_class.new(scope) }
    subject { decorator.all_categories }

    it 'returns all categories' do
      expect(subject).to all(be_a(Categories::BasicDecorator))
      expect(subject.map(&:total)).to eq([10, 20])
    end
  end
end
