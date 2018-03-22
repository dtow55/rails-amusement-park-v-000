class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
    @ride = Ride.new()
  end

  def new
    @attraction = Attraction.new()
  end

  def create
    attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(attraction)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    attraction = Attraction.find(params[:id])
    attraction.update(attraction_params)
    redirect_to attraction_path(attraction)
  end

  def ride
    #binding.pry
    user = User.find(params[:ride][:user_id])
    attraction = Attraction.find(params[:ride][:attraction_id])

    ride = Ride.new(ride_params)

    flash[:alert] = ride.take_ride
    if flash[:alert] == true
      flash[:alert] = "Thanks for riding the #{attraction.name}!"
    end
    #binding.pry
    redirect_to user_path(user)
  end

  private 

  def attraction_params
    params[:attraction].permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

  def ride_params
    params[:ride].permit(:attraction_id, :user_id)
  end
end