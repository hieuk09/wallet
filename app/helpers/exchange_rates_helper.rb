# typed: ignore

module ExchangeRatesHelper
  def all_currencies
    Money::Currency.all.map(&:iso_code)
  end

  def all_accounts
    Account.pluck(:name, :id)
  end
end
