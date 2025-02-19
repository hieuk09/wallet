# typed: true

module Categories
  class BasicDecorator
    include Comparable

    delegate :name, :category_type, :id, to: :category

    def initialize(category)
      @category = category
    end

    def total_usd
      total.exchange_to(:usd).to_f
    end

    def total
      @total ||= category.total
    end

    def <=>(other)
      if category_type == other.category_type
        total <=> other.total
      else
        category_type <=> other.category_type
      end
    end

    def income?
      category_type == Category::INCOME
    end

    def expense?
      category_type == Category::EXPENSE
    end

    private

    attr_reader :category
  end
end
