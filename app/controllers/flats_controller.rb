class FlatsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @flats = Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flats_params)
    if @flat.save
      redirect_to @flat, notice: 'Flat was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @flat.update(flat_params)
      redirect_to @flat, notice: 'Flat was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @flat.destroy
    redirect_to flat_path
  end

  private

  def set_restaurant
    @flat = Flat.find(params[:id])
  end

  def restaurant_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end
end
