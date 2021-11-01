class HistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :take_item, only: [:index, :create]
  before_action :redirect_to_root


  def index
    @form = Form.new
  end

  def create
    binding.pry
    @form = Form.new(history_params)

    if @form.valid?
      pay_item
      @form.save
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
    .require(:form).permit(:zipcode, :state_id, :city, :address, :building, :phone_number).merge(token: params[:token], item_id: params[:item_id],  user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: history_params[:token],
      currency: 'jpy'
    )
  end

  def redirect_to_root
    redirect_to root_path if @item.user_id == current_user.id || @item.history.present?
  end
end