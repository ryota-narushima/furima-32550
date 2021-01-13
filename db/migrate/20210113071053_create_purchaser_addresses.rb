class CreatePurchaserAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :purchaser_addresses do |t|
      t.references :purchase,                null: false, foreign_key: true
      t.string     :postal_code,             null: false
      t.integer    :delivery_source_area_id, null: false
      t.string     :city,                    null: false
      t.string     :address,                 null: false
      t.string     :building
      t.string     :phone_num,               null: false
      t.timestamps
    end
  end
end
