class Account < ActiveRecord::Base
  monetize :initial_balance_cents
  has_many :transactions

  def self.assets
    where('initial_balance_cents > 0').to_a.sum(&:current_balance)
  end

  def self.liabilities
    where('initial_balance_cents < 0').to_a.sum(&:current_balance)
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
