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
  if Rails.env.test?
    config.default_bank = Money::Bank::VariableExchange.new(Money::RatesStore::Memory.new)
  else
    config.default_bank = new_bank
  end
  config.default_currency = :vnd
end
