# typed: false
class SubTransactionsController < ApplicationController
  # GET /sub_transactions/new
  def new
    @transaction = Transaction.find(params[:transaction_id])
    @sub_transaction = @transaction.sub_transactions
      .build(category_id: @transaction.category_id)
  end

  # GET /sub_transactions/1/edit
  def edit
    @transaction = Transaction.find(params[:transaction_id])
    @sub_transaction = SubTransaction.find(params[:id])
  end

  # POST /sub_transactions
  def create
    @transaction = Transaction.find(params[:transaction_id])
    @sub_transaction = @transaction.sub_transactions.new(sub_transaction_params)

    Transaction.transaction do
      @sub_transaction.save!
      @transaction.recalculate_amount
    end

    redirect_to transaction_path(@transaction)
  rescue
    render :new
  end

  # PATCH/PUT /sub_transactions/1
  def update
    @transaction = Transaction.find(params[:transaction_id])
    @sub_transaction = @transaction.sub_transactions.find(params[:id])

    Transaction.transaction do
      @sub_transaction.update!(sub_transaction_params)
      @transaction.recalculate_amount
    end
  rescue
    render :edit
  end

  # DELETE /sub_transactions/1
  def destroy
    sub_transaction = SubTransaction.find(params[:id])
    parent_transaction = sub_transaction.parent_transaction
    Transaction.transaction do
      sub_transaction.destroy!
      parent_transaction.recalculate_amount
    end
    redirect_to transaction_path(parent_transaction)
  end

  private

  # Only allow a trusted parameter "white list" through.
  def sub_transaction_params
    params.require(:sub_transaction).permit(:transaction_id, :amount_cents, :amount_currency, :description, :category_id)
  end
end
