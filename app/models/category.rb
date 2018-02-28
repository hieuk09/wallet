class Category < ActiveRecord::Base
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

  def self.expense_data
    expense.inject({}) do |result, category|
      result.merge(category.name => category.total.exchange_to(:usd).to_f)
    end
  end

  def self.income_data
    income.inject({}) do |result, category|
      result.merge(category.name => category.total.exchange_to(:usd).to_f)
    end
  end

  def total
    amounts = transactions.to_a.map(&:amount)
    BalanceCalculator.new(amounts).sum
  end
end
