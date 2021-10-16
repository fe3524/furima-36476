class ItemsController < ApplicationController

  def index
  end

  def new
  end

  def edit
  end

  def show
  end

  private

  def message_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
end
