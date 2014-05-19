class RestaurantsController < ApplicationController

  def index
    @restaurants =Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    Restaurant.create({name: 'Moro', address: '34 Exmouth Market'})
    redirect_to '/restaurants'
  end

end
