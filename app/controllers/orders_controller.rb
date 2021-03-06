class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :update_status, :customer_orders_list]

  # GET /orders
  # GET /orders.json
  def index
    @orders = current_user.orders.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order_list = @order.order_items.all
    @total_price = 0
    @order_list.each { |x|
      @total_price += x.menu.price
    }
    @total_price += @order.restaurant.delivery_charge
  end

  # GET /orders/new
  def new
    @restaurant_id = params[:restaurant_id]
    session[:shopping_cart] ||= Array.new
    if session[:shopping_cart].present?
      @menus = Menu.where(id: session[:shopping_cart])
    end
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(user_id: current_user.id, restaurant_id: params[:order][:restaurant_id], status: Order.statuses[:requested])
    respond_to do |format|
      if @order.save
        params[:order][:menu_ids].each { |item_id|
          OrderItem.create(order_id: @order.id, menu_id: item_id)
        }
        session[:shopping_cart] = Array.new
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully canceled.' }
      format.json { head :no_content }
    end
  end

  def update_status
    @order.status = params[:status].to_i
    @order.save
    redirect_to(:back)
  end

  def customer_orders_list
    @order_list = @order.order_items.all
    @total_price = 0
    @order_list.each { |x|
      @total_price += x.menu.price
    }
    @total_price += @order.restaurant.delivery_charge
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.fetch(:order, {})
    end
end
