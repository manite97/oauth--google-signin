class HomeController < ApplicationController
  skip_before_action :current_user
  def index
    @orders  = current_user.orders.paginate(:page => params[:page], :per_page => 10) if current_user
  end

  def create
  end
end
