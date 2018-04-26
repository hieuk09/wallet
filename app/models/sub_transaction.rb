class SubTransaction < ApplicationRecord
  belongs_to :parent_transaction, class_name: 'Transaction', foreign_key: 'transaction_id'
  belongs_to :category

  monetize :amount_cents
end
