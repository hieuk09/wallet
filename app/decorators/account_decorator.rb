class AccountDecorator
  delegate :name, to: :account

  def initialize(account)
    @account = account
  end

  def initial_balance
    account.initial_balance.format
  end

  def transactions
    account.transactions.map do |transaction|
      TransactionDecorator.new(transaction)
    end
  end

  private

  attr_reader :account
end
