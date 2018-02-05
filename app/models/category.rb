class Category < ActiveRecord::Base
  INCOME = 'income'.freeze
  EXPENSE = 'expense'.freeze
  ALL = [INCOME, EXPENSE].freeze

  def self.all_categories
    all.map do |category|
      ["#{category.category_type} - #{category.name}", category.id]
    end
  end
end
