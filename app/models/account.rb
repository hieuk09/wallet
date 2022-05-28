# typed: true

class Account < ApplicationRecord
  monetize :initial_balance_cents
  has_many :transactions, dependent: :destroy

  def self.assets
    all.map(&:current_balance).select(&:positive?)
      .sum(DEFAULT_AMOUNT)
  end

  def self.liabilities
    all.map(&:current_balance).select(&:negative?)
      .sum(DEFAULT_AMOUNT)
  end

  def current_balance
    expense = transactions.joins(:category)
      .where('categories.category_type' => Category::EXPENSE)
      .to_a.sum(DEFAULT_AMOUNT, &:amount)
    income = transactions.joins(:category)
      .where('categories.category_type' => Category::INCOME)
      .to_a.sum(DEFAULT_AMOUNT, &:amount)

    initial_balance - expense + income
  end
end
