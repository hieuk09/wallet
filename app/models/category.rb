class Category < ActiveRecord::Base
  INCOME = 'income'.freeze
  EXPENSE = 'expense'.freeze
  ALL = [INCOME, EXPENSE].freeze
end
