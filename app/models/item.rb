class Item < ApplicationRecord
  # アソシエーション
  has_one_attached :image
  belongs_to :user
  has_many :purchases

  # ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :delivery_source_area
  belongs_to :days_to_delivery

  # ジャンルの選択が「--」の時は保存できない
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :delivery_charge_id
    validates :delivery_source_area_id
    validates :days_to_delivery_id
  end

  # 空の投稿は保存できない
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :delivery_charge_id
    validates :delivery_source_area_id
    validates :days_to_delivery_id
    validates :price
  end

  # 販売価格は半角数字で¥300~¥9,999,999の範囲内しか保存できない
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
