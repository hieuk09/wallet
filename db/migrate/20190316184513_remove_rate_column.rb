# typed: true
class RemoveRateColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :exchange_rates, :rate, :float
  end
end
