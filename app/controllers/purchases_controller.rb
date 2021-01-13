class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create] 
  
  def index
    @form_purchase = FormPurchase.new
  end

  def create
    @form_purchase = FormPurchase.new(purchase_params)
     if @form_purchase.valid?
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

  def purchase_params
   params.require(:form_purchase).permit(:postal_code, :delivery_source_area_id, :city, :address, :building, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
