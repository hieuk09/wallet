class AccountSummaryDecorator
  attr_reader :assets, :liabilities

  def initialize
    @assets = Account.assets
    @liabilities = Account.liabilities
  end

  def total
    assets + liabilities
  end
end
