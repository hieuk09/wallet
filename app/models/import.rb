class Import < ApplicationRecord
  belongs_to :account
  has_many :import_transactions
end
