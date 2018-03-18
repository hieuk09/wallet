class TransactionDecorator
  delegate :name, to: :account, prefix: true
  delegate :name, to: :category, prefix: true
  delegate :category_type, to: :category
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

  private

  attr_reader :transaction
  delegate :category, :account, to: :transaction
end
