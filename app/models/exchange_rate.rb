class ExchangeRate < ActiveRecord::Base
  def self.get_rate(from_code, to_code)
    rate = find_by!(from_code: from_code, to_code: to_code)
    rate.rate
  end
end
