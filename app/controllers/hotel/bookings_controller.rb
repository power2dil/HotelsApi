class Hotel::BookingsController < ApplicationController
  before_action :set_hotel_booking, only: %i[ show update destroy ]

  # GET /hotel/bookings
  def index
    @hotel_bookings = Hotel::Booking.where(user: @current_user)

    render json: @hotel_bookings
  end

  # GET /hotel/bookings/1
  def show
    render json: @hotel_booking
  end

  # POST /hotel/bookings
  def create
    @hotel_booking = Hotel::Booking.new(hotel_booking_params, user: @current_user)

    if @hotel_booking.save
      render json: @hotel_booking, status: :created, location: @hotel_booking
    else
      render json: @hotel_booking.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hotel/bookings/1
  def update
    if @hotel_booking.update(hotel_booking_params)
      render json: @hotel_booking
    else
      render json: @hotel_booking.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hotel/bookings/1
  def destroy
    @hotel_booking.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel_booking
      @hotel_booking = Hotel::Booking.find(params[:id], user: @current_user)

      raise ActiveRecord::RecordNotFound if @hotel_booking.nil?
    end

    # Only allow a list of trusted parameters through.
    def hotel_booking_params
      params.require(:hotel_booking).permit(:property_id, :user_id, :status, :start_date, :end_date)
    end
end
