class Hotel::LocationsController < ApplicationController
  before_action :set_hotel_location, only: %i[ show update destroy ]

  # GET /hotel/locations
  def index
    @hotel_locations = Hotel::Location.all

    render json: @hotel_locations
  end

  # GET /hotel/locations/1
  def show
    render json: @hotel_location
  end

  # POST /hotel/locations
  def create
    @hotel_location = Hotel::Location.new(hotel_location_params)

    if @hotel_location.save
      render json: @hotel_location, status: :created, location: @hotel_location
    else
      render json: @hotel_location.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hotel/locations/1
  def update
    if @hotel_location.update(hotel_location_params)
      render json: @hotel_location
    else
      render json: @hotel_location.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hotel/locations/1
  def destroy
    @hotel_location.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel_location
      @hotel_location = Hotel::Location.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hotel_location_params
      params.require(:hotel_location).permit(:city, :state, :country, :pincode)
    end
end
