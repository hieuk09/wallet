# typed: true
class ImportsController < ApplicationController
  def new
    @import = Import.new
  end

  def create
    DbsStatementImporter.new.import(
      params[:import][:file],
      params[:import][:account_id]
    )
    redirect_to imports_path
  end

  def show
    @import = Import.find(params[:id])
  end

  def index
    @imports = Import.all.includes(:account)
  end

  def destroy
    Import.where(id: params[:id]).destroy_all
    redirect_to imports_path
  end
end
