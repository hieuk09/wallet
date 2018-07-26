class ReportsController < ApplicationController
  def transactions
    report_params = params[:report] || {}
    report_params = ExportParams.new(report_params)
    scope = Reports::TransactionQuery.new.execute(report_params)
    decorators = TransactionsByDateDecorator.new(scope).decorate

    @date = report_params.from
    @transactions_data =
      [
        { name: 'Income', data: decorators.map { |decorator| [decorator.paid_at, decorator.income.exchange_to(:usd).to_f] } },
        { name: 'Expense', data: decorators.map { |decorator| [decorator.paid_at, decorator.expense.exchange_to(:usd).to_f] } }
      ]
  end
end
