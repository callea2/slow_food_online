class LandingController < ApplicationController
  def index
    @restaurant_categories = RestaurantCategory.all
  end

  def search_restaurants
    @restaurants = Restaurant.where(category: params[:category])
    binding.pry
    redirect_to :index
  end
end
