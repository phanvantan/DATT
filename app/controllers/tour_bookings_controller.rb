class TourBookingsController < ApplicationController
  before_action :set_tour_booking, only: [:show, :edit, :update, :destroy]

  # GET /tour_bookings
  # GET /tour_bookings.json
  def index
    @tour_bookings = TourBooking.all
  end

  # GET /tour_bookings/1
  # GET /tour_bookings/1.json
  def show
  end

  # GET /tour_bookings/new
  def new
    @tour_booking = TourBooking.new
  end

  # GET /tour_bookings/1/edit
  def edit
  end

  # POST /tour_bookings
  # POST /tour_bookings.json
  def create
    @tour_booking = TourBooking.new(tour_booking_params)

    respond_to do |format|
      if @tour_booking.save
        format.html { redirect_to @tour_booking, notice: 'Tour booking was successfully created.' }
        format.json { render :show, status: :created, location: @tour_booking }
      else
        format.html { render :new }
        format.json { render json: @tour_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tour_bookings/1
  # PATCH/PUT /tour_bookings/1.json
  def update
    respond_to do |format|
      if @tour_booking.update(tour_booking_params)
        format.html { redirect_to @tour_booking, notice: 'Tour booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @tour_booking }
      else
        format.html { render :edit }
        format.json { render json: @tour_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tour_bookings/1
  # DELETE /tour_bookings/1.json
  def destroy
    @tour_booking.destroy
    respond_to do |format|
      format.html { redirect_to tour_bookings_url, notice: 'Tour booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour_booking
      @tour_booking = TourBooking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_booking_params
      params.require(:tour_booking).permit(:tour_detail_id, :name, :price, :status, :time)
    end
end
