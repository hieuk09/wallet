# typed: strict
class AccountDecorator
  extend T::Sig
  delegate :name, :id, to: :account

  sig {params(account: Account).void}
  def initialize(account)
    @account = T.let(account, Account)
  end

  sig {returns(String)}
  def initial_balance
    account.initial_balance.format
  end

  sig {returns(T::Array[TransactionsByDateDecorator::ByDateDecorator])}
  def transactions
    TransactionsByDateDecorator.new(account.transactions.order(:paid_at)).decorate
  end

  private

  sig {returns(Account)}
  attr_reader :account
end
