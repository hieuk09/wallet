class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  def index
    report_params = params[:report] || {}
    @report_params = ExportParams.new(report_params)
    scope = Reports::TransactionQuery.new.execute(@report_params)
      .order(paid_at: :desc).includes(:account, :category)
    @total_count = scope.count
    @transactions = TransactionsByDateDecorator.new(scope).decorate
    @total_income = BalanceCalculator.new(@transactions.map(&:income)).sum
    @total_expense = BalanceCalculator.new(@transactions.map(&:expense)).sum
  end

  # GET /transactions/1
  def show
    @sub_transactions = @transaction.sub_transactions
  end

  # GET /transactions/new
  def new
    if id = params[:id]
      @transaction = Transaction.find(id).dup
    else
      @transaction = Transaction.new
    end
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      redirect_to @transaction, notice: 'Transaction was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /transactions/1
  def update
    if @transaction.update(transaction_params)
      redirect_to @transaction, notice: 'Transaction was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /transactions/1
  def destroy
    @transaction.destroy
    redirect_to transactions_url, notice: 'Transaction was successfully destroyed.'
  end

  def ignore
    transaction = Transaction.find(params[:id])
    if transaction.ignore
      redirect_to transactions_url, notice: 'Transaction was successfully ignored.'
    else
      redirect_to transactions_url, alert: transaction.errors.full_messages.join('. ')
    end
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(
      :category_id,
      :account_id,
      :amount_cents,
      :amount_currency,
      :paid_at,
      :description
    )
  end
end
