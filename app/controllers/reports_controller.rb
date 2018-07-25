class ReportsController < ApplicationController
  def transactions
    decorators = TransactionsByDateDecorator.new(Transaction.all).decorate

    @transactions_data =
      [
        { name: 'Income', data: decorators.map { |decorator| [decorator.paid_at, decorator.income.exchange_to(:usd).to_f] } },
        { name: 'Expense', data: decorators.map { |decorator| [decorator.paid_at, decorator.expense.exchange_to(:usd).to_f] } }
      ]
  end
end
