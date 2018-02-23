class CategoryDecorator
  delegate :name, :category_type, :id, to: :category

  def initialize(category)
    @category = category
  end

  def total
    category.total.format
  end

  def transactions
    TransactionsByDateDecorator.new(category.transactions).decorate
  end

  private

  attr_reader :category
end
