# typed: true
class TransferTransactionsController < ApplicationController
  # GET /transactions/new
  def new
  end

  # POST /transactions
  def create
    transaction_params = safe_params_require(params, :transaction)
    data = transaction_params.permit(
      :amount_cents,
      :amount_currency,
      :paid_at,
      :description
    ).merge(ignored: true)

    from_account_id = transaction_params[:from_account_id]
    to_account_id = transaction_params[:to_account_id]

    Transaction.transaction do
      Transaction.create!(data.merge(account_id: from_account_id, category_id: Category.expense_transfer_category.id))
      Transaction.create!(data.merge(account_id: to_account_id, category_id: Category.income_transfer_category.id))
    end

    redirect_to transactions_path, notice: 'Transaction was successfully created.'
  rescue ActiveRecord::RecordInvalid => e
    redirect_to new_transfer_transaction_path, notice: e.message
  end
end
