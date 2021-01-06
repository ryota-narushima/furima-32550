class Item < ApplicationRecord
  has_one_attached :image

  # ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :delivery_charge, :delivery_source_area, :days_to_delivery

  #ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_charge_id
    validates :delivery_source_area_id
    validates :days_to_delivery_id
  end

  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :category_id
    validates :condition_id
    validates :delivery_charge_id
    validates :delivery_source_area_id
    validates :days_to_delivery_id
  end
  
end
