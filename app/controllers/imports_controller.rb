# typed: true
class ImportsController < ApplicationController
  def new
    @import = Import.new
  end

  def create
    redirect_to imports_path
  end

  def show
  end

  def index
    @imports = Import.all
  end
end
