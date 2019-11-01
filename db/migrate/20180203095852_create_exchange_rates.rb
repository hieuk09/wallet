# typed: false
class CreateExchangeRates < ActiveRecord::Migration
  def change
    create_table :exchange_rates do |t|
      t.string :from_code
      t.string :to_code
      t.float :rate

      t.timestamps null: false
    end
  end
end
