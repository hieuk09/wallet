class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  def index
    @transactions = Transaction.order(:paid_at).map do |transaction|
      TransactionDecorator.new(transaction)
    end
  end

  # GET /transactions/1
  def show
    @sub_transactions = @transaction.sub_transactions
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
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
