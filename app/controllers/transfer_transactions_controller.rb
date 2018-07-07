class TransferTransactionsController < ApplicationController
  # GET /transactions/new
  def new
  end

  # POST /transactions
  def create
    data = params.require(:transaction).permit(
      :amount_cents,
      :amount_currency,
      :paid_at,
      :description
    ).merge(ignored: true)
    from_account_id = params['transaction']['from_account_id']
    to_account_id = params['transaction']['to_account_id']

    Transaction.transaction do
      Transaction.create!(data.merge(account_id: from_account_id, category_id: Category.expense_transfer_category.id))
      Transaction.create!(data.merge(account_id: to_account_id, category_id: Category.income_transfer_category.id))
    end

    redirect_to transactions_path, notice: 'Transaction was successfully created.'
  rescue ActiveRecord::RecordInvalid => e
    redirect_to new_transfer_transaction_path, notice: e.message
  end
end
