class PurchaserAddress < ApplicationRecord
  belongs_to :purchase, optional: true
end
