class Invoice < ApplicationRecord
  monetize :rate_cents
end
