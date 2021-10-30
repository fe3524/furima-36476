class HistoriesController < ApplicationController
  before_action :authenticate_user!

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

  def history_params
    params.require(:form).permit(
      :zipcode,
      :state_id,
      :city,
      :address,
      :building,
      :phone_number
    )
  end
end