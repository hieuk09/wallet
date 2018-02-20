class TransactionsByDateDecorator
  class ByDateDecorator
    attr_reader :paid_at, :transactions

    def initialize(paid_at, transactions)
      @paid_at = paid_at
      @transactions = transactions
    end

    def income
      total_amount(Category::INCOME).format
    end

    def expense
      total_amount(Category::EXPENSE).format
    end

    private

    def total_amount(category_type)
      amount = transactions.select do |transaction|
        transaction.category_type == category_type
      end.sum(&:amount)

      if amount == 0
        Money.new(0, :vnd)
      else
        amount
      end
    end
  end

  def initialize(scope)
    @scope = scope
  end

  def decorate
    scope.map do |transaction|
      TransactionDecorator.new(transaction)
    end.group_by(&:paid_at).map do |paid_at, transactions|
      ByDateDecorator.new(paid_at, transactions)
    end
  end

  private

  attr_reader :scope
end
