class LandingController < ApplicationController
  def index
    @restaurant_categories = RestaurantCategory.all
  end
end
