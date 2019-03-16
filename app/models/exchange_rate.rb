class ExchangeRate < ApplicationRecord
  def rate
    Money.new(100, from_code).exchange_to(to_code)
  end
end
