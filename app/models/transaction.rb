class Transaction < ActiveRecord::Base
  belongs_to :category
  belongs_to :account

  monetize :amount_cents
end
