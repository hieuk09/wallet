# encoding : utf-8
MoneyRails.configure do |config|
  config.default_currency = :vnd
  config.default_bank = Money::Bank::VariableExchange.new(ExchangeRate)
end
