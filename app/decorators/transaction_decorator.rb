class TransactionDecorator
  delegate :name, to: :account, prefix: true
  delegate :name, to: :category, prefix: true
  delegate :description, :id, :amount, :account_id, to: :transaction

  def initialize(transaction)
    @transaction = transaction
  end

  def amount_format
    amount.format
  end

  def paid_at
    transaction.paid_at.strftime('%F')
  end

  def category_type
    if transaction.ignored?
      'ignored'
    else
      category.category_type
    end
  end

  private

  attr_reader :transaction
  delegate :category, :account, to: :transaction
end
