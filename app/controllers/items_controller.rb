class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  # 実装後に追記する
  # :edit, :show

  def index
    @items = Item.all.order('created_at DESC')
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
    @item = Item.find(params[:id])
  end

  def show
    @items = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)

    if item.update(item_params)
      redirect_to item_path(item.id)
    else
      render :edit
    end
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
