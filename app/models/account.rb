class Account < ActiveRecord::Base
  monetize :initial_balance_cents
end
