class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy, :add_to_cart, :delete_from_cart]
  before_action :set_restaurant, :only => [:index, :create, :new, :edit]

  # GET /menus
  # GET /menus.json
  def index
    @restaurant_id = @restaurant_id
    @menus = @restaurant.menus.all
  end

  def list
  end

  def add_to_cart
    session[:shopping_cart] ||= Array.new
    session[:shopping_cart].push(@menu.id)
    redirect_to(:back)
  end

  def delete_from_cart
    session[:shopping_cart] ||= Array.new
    session[:shopping_cart].delete(@menu.id)
    redirect_to(:back)
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
  end

  # GET /menus/new
  def new
    @menu = Menu.new()
  end

  # GET /menus/1/edit
  def edit
  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = @restaurant.menus.new(menu_params)

    respond_to do |format|
      if @menu.save
        format.html { redirect_to restaurant_menus_path(:restaurant_id => @restaurant_id), notice: 'Menu was successfully created.' }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to @menu, notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to menus_url, notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
      @restaurant_id = @restaurant.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:restaurant_id, :name, :description, :image_path, :price)
    end
end
