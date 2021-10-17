class ItemsController < ApplicationController

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

  def edit
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(
      :image, 
      :title, 
      :description, 
      :category_id, 
      :status_id, 
      :state_id, 
      :fee_id, 
      :day_id, 
      :price
    ).merge(user_id: current_user.id)
  end
end
