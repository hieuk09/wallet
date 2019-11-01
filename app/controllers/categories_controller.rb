# typed: true
class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]

  # GET /categories
  def index
    @decorator = Categories::SummaryDecorator.new(Category.all)
  end

  # GET /categories/1
  def show
    category = Category.find(params[:id])
    @category = CategoryDecorator.new(category)
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def category_params
      input_params = params.require(:category)
      if input_params.is_a?(ActionController::Parameters)
        input_params.permit(:category_type, :name)
      else
        {}
      end
    end
end
