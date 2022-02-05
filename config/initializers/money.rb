# typed: ignore
# encoding : utf-8
require 'money/bank/open_exchange_rates_bank'

def new_bank
  Money::Bank::OpenExchangeRatesBank.new.tap do |oxr|
    oxr.cache = 'tmp/exchange_rates.json'
    oxr.app_id = Rails.application.secrets.open_exchange_rate_app_id
    oxr.ttl_in_seconds = 86400
    oxr.update_rates
  end
end

MoneyRails.configure do |config|
  config.default_bank = if Rails.env.test?
    Money::Bank::VariableExchange.new(Money::RatesStore::Memory.new)
  else
    new_bank
  end
  config.default_currency = :vnd
  config.default_format = { with_currency: true, symbol: false }
end

Money.locale_backend = :i18n
Money.rounding_mode = BigDecimal::ROUND_HALF_UP

DEFAULT_AMOUNT = Money.new(0, :vnd)
