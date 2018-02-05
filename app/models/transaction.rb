class Transaction < ActiveRecord::Base
  belongs_to :category
  belongs_to :account

  has_many :sub_transactions

  monetize :amount_cents

  def recalculate_amount
    self.amount = sub_transactions.map(&:amount).sum
    self.save
  end
end
