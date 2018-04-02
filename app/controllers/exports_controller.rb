class ExportsController < ApplicationController
  def new; end

  def create
    export_params = ExportParams.new(params[:export])
    transactions = Transaction.where(paid_at: export_params.from..export_params.to)
    exporter = Transactions::MonthlyExporter.new(transactions)
    send_data exporter.generate, filename: export_params.file_name
  end
end
