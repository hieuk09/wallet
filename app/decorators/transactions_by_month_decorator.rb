# typed: true
class TransactionsByMonthDecorator
  class ByMonthDecorator
    attr_reader :paid_at, :transactions

    def initialize(paid_at, transactions)
      @paid_at = paid_at
      @transactions = transactions
    end

    def income
      total_amount(Category::INCOME)
    end

    def expense
      total_amount(Category::EXPENSE)
    end

    def total
      income - expense
    end

    private

    def total_amount(category_type)
      amounts = transactions.select do |transaction|
        transaction.category_type == category_type
      end.map(&:amount)
      BalanceCalculator.new(amounts).sum
    end
  end

  def initialize(scope)
    @scope = scope
  end

  def decorate
    scope.map do |transaction|
      TransactionDecorator.new(transaction)
    end.group_by(&:paid_month).map do |paid_at, transactions|
      ByMonthDecorator.new(paid_at, transactions)
    end
  end

  private

  attr_reader :scope
end
