# typed: true
class BalanceCalculator
  def initialize(array)
    @array = array
  end

  def sum
    value = array.sum

    if value.is_a?(Money)
      value
    else
      Money.new(value)
    end
  end

  private

  attr_reader :array
end
