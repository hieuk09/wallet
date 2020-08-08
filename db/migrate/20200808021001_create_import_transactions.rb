class CreateImportTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :import_transactions do |t|
      t.references :import, null: false, foreign_key: true
      t.string :description, null: false
      t.string :category, null: false
      t.datetime :transaction_date, null: false
      t.money :amount, null: false

      t.timestamps
    end
  end
end
