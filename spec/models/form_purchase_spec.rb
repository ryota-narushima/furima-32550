require 'rails_helper'

RSpec.describe FormPurchase, type: :model do
  describe '購入情報の保存' do
    before do
      @form_purchase = FactoryBot.build(:form_purchase)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@form_purchase).to be_valid
    end
    it 'buildingは空でも保存できること' do
      @form_purchase.building = ""
      expect(@form_purchase).to be_valid
    end

    it "tokenが空では登録できないこと" do
      @form_purchase.token = ""
      @form_purchase.valid?
      expect(@form_purchase.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空だと保存できないこと' do
      @form_purchase.postal_code = ""
      @form_purchase.valid?
      expect(@form_purchase.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @form_purchase.postal_code = "1234567"
      @form_purchase.valid?
      expect(@form_purchase.errors.full_messages).to include("Postal code is invalid")
    end
    it 'delivery_source_area_idが空だと保存できないこと' do
      @form_purchase.delivery_source_area_id = ""
      @form_purchase.valid?
      expect(@form_purchase.errors.full_messages).to include("Delivery source area can't be blank")
    end
    it 'delivery_source_area_idを選択していないと保存できないこと' do
      @form_purchase.delivery_source_area_id = 0
      @form_purchase.valid?
      expect(@form_purchase.errors.full_messages).to include("Delivery source area must be other than 0")
    end
    it 'cityが空だと保存できないこと' do
      @form_purchase.city = ""
      @form_purchase.valid?
      expect(@form_purchase.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @form_purchase.address = ""
      @form_purchase.valid?
      expect(@form_purchase.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numが空だと保存できないこと' do
      @form_purchase.phone_num = ""
      @form_purchase.valid?
      expect(@form_purchase.errors.full_messages).to include("Phone num can't be blank")
    end
    it 'phone_numにハイフンがあると保存できないこと' do
      @form_purchase.phone_num = "090-1234-1234"
      @form_purchase.valid?
      expect(@form_purchase.errors.full_messages).to include("Phone num is invalid")
    end
    it 'user_idが空だと保存できないこと' do
      @form_purchase.user_id = ""
      @form_purchase.valid?
      expect(@form_purchase.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空だと保存できないこと' do
      @form_purchase.item_id = ""
      @form_purchase.valid?
      expect(@form_purchase.errors.full_messages).to include("Item can't be blank")
    end
  end
end