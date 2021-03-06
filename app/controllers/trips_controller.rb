class TripsController < ApplicationController
	before_action :trip, only: [:edit, :show, :update, :destroy] 

  def index
  	@trips = Trip.all
  end

  def show
  end

  def new
  	@trip = Trip.new
  end

  def create
  	@trip = Trip.new(trip_params)
  	if @trip.save
  		redirect_to trip_path(@trip)
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @trip.update(trip_params)
  		redirect_to trip_path(@trip)
  	else
  		render :edit
  	end
  end

  def destroy
  	if @trip.destroy
  		redirect_to trips_path
  	else
  		redirect_to trip_path(@trip)
  	end
  end

  private

  def trip_params
  	params.require(:trip).permit(:name, :distance, :date)
  end

  def trip
  	@trip = Trip.find(params[:id])
  end
end







