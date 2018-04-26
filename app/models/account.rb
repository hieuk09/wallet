class Account < ApplicationRecord
  monetize :initial_balance_cents
  has_many :transactions, dependent: :destroy

  def self.assets
    balances = all.map(&:current_balance).select(&:positive?)
    BalanceCalculator.new(balances).sum
  end

  def self.liabilities
    balances = all.map(&:current_balance).select(&:negative?)
    BalanceCalculator.new(balances).sum
  end

  def current_balance
    expense = transactions.joins(:category)
      .where('categories.category_type' => Category::EXPENSE)
      .to_a.sum(&:amount)
    income = transactions.joins(:category)
      .where('categories.category_type' => Category::INCOME)
      .to_a.sum(&:amount)

    initial_balance - expense + income
  end
end
