# typed: false
class ImportTransaction < ApplicationRecord
  belongs_to :import
  belongs_to :account
  belongs_to :category

  monetize :amount_cents
end
