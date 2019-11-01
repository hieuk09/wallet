# typed: false
class CreateSubTransactions < ActiveRecord::Migration
  def change
    create_table :sub_transactions do |t|
      t.references :transaction, index: true, foreign_key: true
      t.money :amount
      t.text :description
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
