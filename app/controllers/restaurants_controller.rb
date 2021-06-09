class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :update, :destroy]

  # GET /restaurants
  def index
    @restaurants = Restaurant.all

    render json: @restaurants
  end

  # GET /restaurants/1
  def show
    render json: @restaurant
  end

  # POST /restaurants
  def create
    @address = Address.new(address_params)
    if @address.save
      @restaurant = Restaurant.new(restaurant_params.merge(address_id: @address.id, owner_id: current_user.id))
      if @restaurant.save
        render json: @restaurant, status: :created, location: @restaurant
      else
        render json: @restaurant.errors, status: :unprocessable_entity
      end
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /restaurants/1
  def update
    if @restaurant.update(restaurant_params)
      render json: @restaurant
    else
      render json: @restaurant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /restaurants/1
  def destroy
    @restaurant.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :cnpj, :open_at, :close_at, :workdays)
    end
end
