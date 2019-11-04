# typed: strict
class AccountSummaryDecorator
  extend T::Sig
  sig {returns(Money)}
  attr_reader :assets
  sig {returns(Money)}
  attr_reader :liabilities

  sig {void}
  def initialize
    @assets = T.let(Account.assets, Money)
    @liabilities = T.let(Account.liabilities, Money)
  end

  sig {returns(Money)}
  def total
    assets + liabilities
  end
end
