class FormPurchase

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :purchase_id, :postal_code, :delivery_source_area_id, :city, :address, :building, :phone_num, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :delivery_source_area_id, numericality: { other_than: 0 }
    validates :city
    validates :address
    validates :phone_num, format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
  end
  


  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    PurchaserAddress.create(purchase_id: purchase.id, postal_code: postal_code, delivery_source_area_id: delivery_source_area_id, city: city, address: address, building: building, phone_num: phone_num)
  end
end