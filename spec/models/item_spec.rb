require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it 'image, name, description, category_id, condition_id, delivery_charge_id, delivery_source_area_id, days_to_delivery_id, priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      # 値が空では出品できない
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition is not a number')
      end
      it 'delivery_charge_idが空では登録できない' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery charge is not a number')
      end
      it 'delivery_source_area_idが空では登録できない' do
        @item.delivery_source_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery source area is not a number')
      end
      it 'days_to_delivery_idが空では登録できない' do
        @item.days_to_delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to delivery is not a number')
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      # ジャンルの選択が「--」の時は出品できない
      it 'category_idが選択が「--」の時は出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end
      it 'condition_idが選択が「--」の時は出品できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 0')
      end
      it 'delivery_charge_idが選択が「--」の時は出品できない' do
        @item.delivery_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery charge must be other than 0')
      end
      it 'delivery_source_area_idが選択が「--」の時は出品できない' do
        @item.delivery_source_area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery source area must be other than 0')
      end
      it 'days_to_delivery_idが選択が「--」の時は出品できない' do
        @item.days_to_delivery_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to delivery must be other than 0')
      end

      # priceは半角数字で¥300~¥9,999,999の範囲内しか保存できない
      it 'priceが全角数字では出品できない' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが半角数字でも300未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが半角数字でも10,000,000以上では出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceが半角英数混合では出品できない' do
        @item.price = 'abc1000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが半角英語だけでは出品できない' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
