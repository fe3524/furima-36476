class HistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :take_item, only: [:index, :create]

  def index
    @form = Form.new
  end

  def create
    @history = History.new(history_params)
    Trading.create(trading_params)

    if @history.save
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
    params.merge(user_id: current_user.id)
  end

  def trading_params
    params.permit(
      :zipcode,
      :state_id,
      :city,
      :address,
      :building,
      :phone_number
    ).merge(history_id: @history.id)
  end
end