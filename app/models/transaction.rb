# typed: true
class Transaction < ApplicationRecord
  belongs_to :category
  belongs_to :account

  has_many :sub_transactions

  monetize :amount_cents

  def recalculate_amount
    expense = sub_transactions.joins(:category)
      .where('categories.category_type' => Category::EXPENSE)
      .to_a.sum(&:amount)
    income = sub_transactions.joins(:category)
      .where('categories.category_type' => Category::INCOME)
      .to_a.sum(&:amount)

    self.amount = if category.category_type == Category::EXPENSE
      expense - income
    else
      income - expense
    end

    save!
  end

  def ignore
    update(ignored: true)
  end
end
