class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :redirect_to_root, only: [:edit, :update]
  before_action :item_find, only: [:edit, :show, :update]

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
  end

  def show
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
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

  def redirect_to_root
    @item = Item.find(params[:id])
    redirect_to root_path unless @item.user_id == current_user.id
  end

  def item_find
    @item = Item.find(params[:id])
  end
end
