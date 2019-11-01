# typed: true
class TransferTransactionsController < ApplicationController
  # GET /transactions/new
  def new
  end

  # POST /transactions
  def create
    data = transaction_params(params)

    if data.nil?
      redirect_to new_transfer_transaction_path, notice: 'Params is invalid'
      return
    end

    from_account_id = params.dig('transaction', 'from_account_id')
    to_account_id = params.dig('transaction', 'to_account_id')

    Transaction.transaction do
      Transaction.create!(data.merge(account_id: from_account_id, category_id: Category.expense_transfer_category.id))
      Transaction.create!(data.merge(account_id: to_account_id, category_id: Category.income_transfer_category.id))
    end

    redirect_to transactions_path, notice: 'Transaction was successfully created.'
  rescue ActiveRecord::RecordInvalid => e
    redirect_to new_transfer_transaction_path, notice: e.message
  end

  private

  def transaction_params(input_params)
    input_params = input_params.require(:transaction)

    if input_params.is_a?(ActionController::Parameters)
      input_params.permit(
        :amount_cents,
        :amount_currency,
        :paid_at,
        :description
      ).merge(ignored: true)
    end
  end
end
