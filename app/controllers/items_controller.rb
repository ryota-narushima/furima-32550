class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: :edit

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    if @item.user_id == current_user.id
      if @item.destroy
        redirect_to action: :index
      else
        render :show
      end
    else
      render :show
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    if @item.purchases.present?
      redirect_to action: :index
    end
  end

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :delivery_charge_id,
                                 :delivery_source_area_id, :days_to_delivery_id, :price).merge(user_id: current_user.id)
  end
end
