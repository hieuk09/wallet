# typed: true

class AddIndexToPaidAt < ActiveRecord::Migration[5.2]
  def change
    add_index :transactions, :paid_at
  end
end
