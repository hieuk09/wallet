# typed: strict
module Categories
  class BasicDecorator
    extend T::Sig
    include Comparable

    delegate :name, :category_type, :id, :name, to: :category

    sig {params(category: Category).void}
    def initialize(category)
      @category = T.let(category, Category)
      @total = T.let(nil, T.nilable(Money))
    end

    sig {returns(Float)}
    def total_usd
      total.exchange_to(:usd).to_f
    end

    sig {returns(Money)}
    def total
      @total ||= category.total
    end

    sig {params(other: Categories::BasicDecorator).returns(Integer)}
    def <=>(other)
      if category_type == other.category_type
        total <=> other.total
      else
        category_type <=> other.category_type
      end
    end

    sig {returns(T::Boolean)}
    def income?
      category_type == Category::INCOME
    end

    sig {returns(T::Boolean)}
    def expense?
      category_type == Category::EXPENSE
    end

    private

    sig {returns(Category)}
    attr_reader :category
  end
end
