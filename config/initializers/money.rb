# encoding : utf-8
require 'money/bank/open_exchange_rates_bank'

oxr = Money::Bank::OpenExchangeRatesBank.new
oxr.cache = 'tmp/exchange_rates.json'
oxr.app_id = Rails.application.secrets.open_exchange_rate_app_id
oxr.ttl_in_seconds = 86400
oxr.update_rates

MoneyRails.configure do |config|
  config.default_currency = :vnd
  config.default_bank = oxr
end
