class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create] 
  before_action :move_to_index, only: [:index, :create]
  before_action :sold_out, only: [:index, :create]
  
  def index
    @form_purchase = FormPurchase.new
  end

  def create
    @form_purchase = FormPurchase.new(purchase_params)
      if @form_purchase.valid?
        pay_item
        @form_purchase.save
        redirect_to items_path
      else
        render action: :index
      end
  end
 
  private
   
  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price],  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def move_to_index
    set_item
    if current_user.id == @item.user_id
      redirect_to items_path
    end
  end

  def sold_out
    set_item
    if @item.purchases.present?
      redirect_to items_path
    end
  end

  def purchase_params
    params.require(:form_purchase).permit(:postal_code, :delivery_source_area_id, :city, :address, :building, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

end
