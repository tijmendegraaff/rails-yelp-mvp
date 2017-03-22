class RestaurantsController < ApplicationController
  before_action :load_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to restaurants_path
  end

  def edit
  end

  def update
    # @task.done = boolean_value_for_checkbox_inputs(task_params[:done])
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end
