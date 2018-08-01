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

  def categories
    report_params = params[:report] || {}
    report_params = ExportParams.new(report_params)
    scope = Reports::TransactionQuery.new(Transaction.where(ignored: false)).execute(report_params)

    @date = report_params.from

    @categories_data = scope.map do |transaction|
      TransactionDecorator.new(transaction)
    end.group_by(&:category_name).map do |category_name, transactions|
      default_data = { 'income' => 0, 'expense' => 0 }
      data = transactions.group_by(&:category_type).inject(default_data) do |result, (category_type, trans)|
        default_data.merge(category_type => trans.sum(&:amount).exchange_to(:usd).to_f)
      end
      {
        name: category_name,
        data: data
      }
    end
  end
end
