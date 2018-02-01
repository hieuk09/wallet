# encoding : utf-8

MoneyRails.configure do |config|
end

Money.default_bank = Money::Bank::VariableExchange.new(Money::RatesStore::Memory.new)
