# typed: true

module Categories
  class SummaryDecorator
    def initialize(scope)
      @scope = scope
    end

    def income_data
      income_categories.inject({}) do |result, category|
        result.merge(category.name => category.total_usd)
      end
    end

    def expense_data
      expense_categories.inject({}) do |result, category|
        result.merge(category.name => category.total_usd)
      end
    end

    def all_categories
      @all_categories ||= scope.map do |category|
        Categories::BasicDecorator.new(category)
      end.sort
    end

    private

    attr_reader :scope

    def income_categories
      @income_categories ||= all_categories.select(&:income?)
    end

    def expense_categories
      @expense_categories ||= all_categories.select(&:expense?)
    end
  end
end
