class OrdersController < ApplicationController
  before_action :set_user

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = @user.orders.find(params['id'])
    respond_to do |format|
      format.html { render :show }
      format.json {render :json => @order, :layout => false }
    end
  end

  # GET /orders/new
  def new
    @order = @user.orders.build
  end

  # POST /orders
  # POST /orders.json
  def create
    @user =  current_user
    # @user = User.find(params[:user_id])
    @order = @user.orders.new
    if @order.save
      params[:item_name].each_with_index do |item_name ,index|
        @order_line = OrderLine.new
        @order_line.order_id = @order.id
        @order_line.item_name = item_name
        @order_line.quantity = params[:item_quantity][index]
        @order_line.save!
      end
    end
    redirect_to root_path , notice: "Your Order created successfully"
  end


  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = @user.orders.find(params['id'])
    @order.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.fetch(:order, {})
    end
end
