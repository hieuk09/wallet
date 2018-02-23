class Category < ActiveRecord::Base
  INCOME = 'income'.freeze
  EXPENSE = 'expense'.freeze
  ALL = [INCOME, EXPENSE].freeze

  has_many :transactions

  def self.all_categories
    all.map do |category|
      ["#{category.category_type} - #{category.name}", category.id]
    end
  end

  def total
    amounts = transactions.to_a.map(&:amount)
    BalanceCalculator.new(amounts).sum
  end
end
