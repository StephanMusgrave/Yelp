class ReviewsController < ApplicationController
  # def new
  #   @restaurant = Restaurant.find(params[:restaurant_id])
  #   @review = Review.new
  # end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.create!(params[:review].permit(:thoughts, :rating))

    # redirect_to '/restaurants'
    
    #render using create.json.jbuilder:
    render 'create', content_type: :json
    # render json: review
  end


end
