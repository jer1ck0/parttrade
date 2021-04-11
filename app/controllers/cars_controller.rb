class CarsController < ApplicationController
  
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = Car.all
  end

  def show
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save 
        redirect_to :controller => "users", :action => "new"
    else
        redirect_to :action => "index", notice: "Your user no send"
    end
  end
  
  def edit
  end

  def update
    if @car.update_attributes(car_params)
      redirect_to user_path(User.find(@car.user_id))
  else
      render :edit
  end
  end

  def destroy
    @car.destroy
    redirect_to user_path(User.find(@car.user_id))
  end

  private
    def set_car
      @car = Car.find(params[:id])
    end

    def car_params
      params.fetch(:car, {}).permit(:vin, :vendor, :model, :year, :mileage, :user_id, :comment)
    end
end
