class Api::V1::DishesController < ApiController
  def index
    menu = Menu.find_by(name: params[:menu])
    @dishes = Dish.where(menu: menu)
    render json: { entries: @dishes }
  end
end
