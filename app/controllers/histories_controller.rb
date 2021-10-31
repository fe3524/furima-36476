class HistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :take_item, only: [:index, :create]

  def index
    @form = Form.new
  end

  def create
    @form = Form.new(history_params)

    if @form.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def take_item
    @item = Item.find(params[:item_id])
  end

  def history_params
    params
    .require(:form)
    .permit(:zipcode, :state_id, :city, :address, :building, :phone_number)
    .merge(item_id: params[:item_id], user_id: current_user.id)
  end
end