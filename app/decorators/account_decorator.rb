# typed: true

class AccountDecorator
  delegate :name, :id, to: :account

  def initialize(account)
    @account = account
  end

  def initial_balance
    account.initial_balance.format
  end

  def transactions
    TransactionsByDateDecorator.new(account.transactions.order(:paid_at)).decorate
  end

  private

  attr_reader :account
end
