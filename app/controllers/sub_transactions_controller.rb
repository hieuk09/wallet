class SubTransactionsController < ApplicationController
  before_action :set_sub_transaction, only: [:destroy]

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

    if @sub_transaction.save
      @transaction.recalculate_amount
      redirect_to transaction_path(@transaction)
    else
      render :new
    end
  end

  # PATCH/PUT /sub_transactions/1
  def update
    @transaction = Transaction.find(params[:transaction_id])
    @sub_transaction = @transaction.sub_transactions.find(params[:id])
    if @sub_transaction.update(sub_transaction_params)
      @transaction.recalculate_amount
      redirect_to transaction_path(@transaction)
    else
      render :edit
    end
  end

  # DELETE /sub_transactions/1
  def destroy
    @sub_transaction.destroy
    @sub_transaction.parent_transaction.recalculate_amount
    redirect_to transaction_path(@sub_transaction.parent_transaction)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_sub_transaction
    @sub_transaction = SubTransaction.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def sub_transaction_params
    params.require(:sub_transaction).permit(:transaction_id, :amount_cents, :amount_currency, :description, :category_id)
  end
end
