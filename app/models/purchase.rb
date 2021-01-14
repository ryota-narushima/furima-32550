class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :purchaser_address, dependent: :destroy
end
