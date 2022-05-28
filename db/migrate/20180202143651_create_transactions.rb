# typed: false

class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :category, index: true, foreign_key: true
      t.references :account, index: true, foreign_key: true
      t.money :amount
      t.datetime :paid_at
      t.string :description

      t.timestamps null: false
    end
  end
end
