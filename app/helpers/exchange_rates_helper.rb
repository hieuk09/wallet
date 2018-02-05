module ExchangeRatesHelper
  def all_currencies
    Money::Currency.all.map(&:iso_code)
  end
end
