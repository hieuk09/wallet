# typed: true
class AccountsController < ApplicationController
  before_action :set_account, only: %i[edit update destroy]

  # GET /accounts
  def index
    @summary = AccountSummaryDecorator.new
    @accounts = Account.all
  end

  # GET /accounts/1
  def show
    account = Account.find(params[:id])
    @account = AccountDecorator.new(account)
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit; end

  # POST /accounts
  def create
    @account = Account.new(account_params)

    if @account.save
      redirect_to @account, notice: 'Account was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /accounts/1
  def update
    if @account.update(account_params)
      redirect_to @account, notice: 'Account was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /accounts/1
  def destroy
    @account.destroy
    redirect_to accounts_url, notice: 'Account was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_account
    @account = Account.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def account_params
    safe_params_require(params, :account).permit(:initial_balance_cents, :initial_balance_currency, :name)
  end
end
