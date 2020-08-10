class CreateImportTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :import_transactions do |t|
      t.references :account, null: false, foreign_key: true, on_delete: :cascade, index: true
      t.references :category, null: false, foreign_key: true, on_delete: :cascade, index: true
      t.references :import, null: false, foreign_key: true, on_delete: :cascade, index: true
      t.string :description, null: false
      t.datetime :paid_at, null: false
      t.money :amount, null: false

      t.timestamps null: false
    end
  end
end
