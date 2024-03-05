class Hotel::PropertiesController < ApplicationController
  before_action :set_hotel_property, only: %i[ show update destroy ]

  # GET /hotel/properties
  def index
    @hotel_properties = Hotel::Property.all

    render json: @hotel_properties
  end

  # GET /hotel/properties/1
  def show
    render json: @hotel_property
  end

  # POST /hotel/properties
  def create
    @hotel_property = Hotel::Property.new(hotel_property_params)

    if @hotel_property.save
      render json: @hotel_property, status: :created, location: @hotel_property
    else
      render json: @hotel_property.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hotel/properties/1
  def update
    if @hotel_property.update(hotel_property_params)
      render json: @hotel_property
    else
      render json: @hotel_property.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hotel/properties/1
  def destroy
    @hotel_property.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel_property
      @hotel_property = Hotel::Property.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hotel_property_params
      params.require(:hotel_property).permit(:name, :rating_score, :review_score, :location_id)
    end
end
