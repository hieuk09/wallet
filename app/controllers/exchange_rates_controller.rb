class ExchangeRatesController < ApplicationController
  before_action :set_exchange_rate, only: [:show, :edit, :update, :destroy]

  # GET /exchange_rates
  def index
    @exchange_rates = ExchangeRate.all
  end

  # GET /exchange_rates/1
  def show
  end

  # GET /exchange_rates/new
  def new
    @exchange_rate = ExchangeRate.new
  end

  # GET /exchange_rates/1/edit
  def edit
  end

  # POST /exchange_rates
  def create
    @exchange_rate = ExchangeRate.new(exchange_rate_params)

    if @exchange_rate.save
      redirect_to @exchange_rate, notice: 'Exchange rate was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /exchange_rates/1
  def update
    if @exchange_rate.update(exchange_rate_params)
      redirect_to @exchange_rate, notice: 'Exchange rate was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /exchange_rates/1
  def destroy
    @exchange_rate.destroy
    redirect_to exchange_rates_url, notice: 'Exchange rate was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exchange_rate
      @exchange_rate = ExchangeRate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def exchange_rate_params
      params.require(:exchange_rate).permit(:from_code, :to_code, :rate)
    end
end
