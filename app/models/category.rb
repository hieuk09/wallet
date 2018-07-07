class Category < ApplicationRecord
  INCOME = 'income'.freeze
  EXPENSE = 'expense'.freeze
  ALL = [INCOME, EXPENSE].freeze

  has_many :transactions
  scope :income, -> { where(category_type: INCOME) }
  scope :expense, -> { where(category_type: EXPENSE) }

  def self.all_categories
    all.map do |category|
      ["#{category.category_type} - #{category.name}", category.id]
    end
  end

  def self.expense_transfer_category
    expense.find_by(name: 'Transfer')
  end

  def self.income_transfer_category
    income.find_by(name: 'Transfer')
  end

  def total
    amounts = transactions.where(ignored: false).to_a.map(&:amount)
    BalanceCalculator.new(amounts).sum
  end
end
