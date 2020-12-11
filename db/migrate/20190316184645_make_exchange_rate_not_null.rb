# typed: false
class MakeExchangeRateNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :exchange_rates, :from_code, false
    change_column_null :exchange_rates, :to_code, false
  end
end
