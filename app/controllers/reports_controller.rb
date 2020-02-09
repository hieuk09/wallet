# typed: true
class ReportsController < ApplicationController
  def transactions
    report_params = params[:report] || {}
    @report_params = ExportParams.new(report_params)
    scope = Reports::TransactionQuery.new.execute(@report_params)
    decorators = TransactionsByDateDecorator.new(scope).decorate

    income_data = decorators.map { |decorator| [decorator.paid_at, decorator.income.exchange_to(:usd).to_f] }
    expense_data = decorators.map { |decorator| [decorator.paid_at, decorator.expense.exchange_to(:usd).to_f] }

    @transactions_data =
      [
        { name: 'Income', data: income_data },
        { name: 'Expense', data: expense_data }
      ]
  end

  def categories
    report_params = params[:report] || {}
    @report_params = ExportParams.new(report_params)
    scope = Reports::TransactionQuery.new(Transaction.where(ignored: false))
      .execute(@report_params)

    @categories_data = scope.map do |transaction|
      TransactionDecorator.new(transaction)
    end.group_by(&:category_name).map do |category_name, transactions|
      default_data = { 'income' => 0, 'expense' => 0 }
      data = transactions.group_by(&:category_type).inject(default_data) do |result, (category_type, trans)|
        result.merge(category_type => trans.sum(&:amount).exchange_to(:usd).to_f)
      end

      {
        name: category_name,
        data: data
      }
    end
  end

  def burn_rate
    start_of_month = Time.current.beginning_of_month

    scope = Transaction.all.joins(:category)
      .where(ignored: false).merge(Category.expense)
    query = Reports::TransactionQuery.new(scope)

    monthly_data = []

    6.downto(1) do |x|
      start_date = start_of_month - x.months
      end_date = start_date.end_of_month
      query_params = OpenStruct.new(all?: false, from: start_date, to: end_date)
      monthly_data << query.execute(query_params).sum(&:amount)
    end

    average = monthly_data.sum / monthly_data.count

    summary = AccountSummaryDecorator.new
    total = summary.total

    @data = []
    @month_run_way = if average.positive?
      "#{(total / average).ceil} months"
    else
      'Infinite'
    end

    while total.positive?
      @data << [start_of_month.strftime('%b %Y'), total.exchange_to(:usd).to_f]
      start_of_month += 1.month
      total -= average
    end
  end

  def runway
    scope = Transaction.all.joins(:category)
      .where(ignored: false)

    @data = {
      paid_month: [],
      income: [],
      expense: [],
      balance: []
    }

    TransactionsByMonthDecorator.new(scope).decorate.each do |decorator|
      @data[:paid_month] << decorator.paid_at
      @data[:income] << decorator.income.exchange_to(:usd).to_f
      @data[:expense] << -decorator.expense.exchange_to(:usd).to_f
      @data[:balance] << decorator.total.exchange_to(:usd).to_f
    end
  end
end
