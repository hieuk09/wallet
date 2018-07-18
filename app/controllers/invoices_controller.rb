class InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all
  end

  def new
    @invoice = Invoice.new
  end

  def create
    invoice_params = params.require(:invoice)
      .permit(:name, :rate_cents, :time, :rate_currency)
    @invoice = Invoice.new(invoice_params)

    if @invoice.save
      redirect_to invoices_path
    else
      render :new
    end
  end
end
