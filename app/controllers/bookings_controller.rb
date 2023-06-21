class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]

  # GET /bookings or /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1 or /bookings/1.json
  def show
  end

  # GET /bookings/new


  # GET /bookings/1/edit
  def edit
  end



  def create
    @voiture = Voiture.find(params[:voiture_id])
    # @booking = @voiture.bookings.build(booking_params)
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.voiture = @voiture

    @booking.save
    redirect_to bookings_path
    # respond_to do |format|
    #   if @booking.save
    #     format.html { redirect_to booking_url(@booking), notice: "Booking was successfully created." }
    #     format.json { render :show, status: :created, location: @booking }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @booking.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to booking_url(@booking), notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def current_user_booking
    @bookings = Booking.where(user_id: current_user.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:date_debut, :date_fin, :valide)
    end
end
