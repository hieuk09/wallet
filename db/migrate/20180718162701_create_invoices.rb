class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.string :name, null: false
      t.money :rate, null: false
      t.integer :time, null: false

      t.timestamps
    end
  end
end
