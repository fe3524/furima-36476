class HistoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @form = Form.new
  end

end
end
