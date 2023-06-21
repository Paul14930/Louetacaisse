class VoituresController < ApplicationController
  before_action :set_voiture, only: %i[ show edit update destroy ]

  # GET /voitures or /voitures.json
  def index
    @voitures = Voiture.all
  end

  # GET /voitures/1 or /voitures/1.json
  def show
  end

  # GET /voitures/new
  def new
    @voiture = Voiture.new
  end

  # GET /voitures/1/edit
  def edit
  end

  # POST /voitures or /voitures.json
  def create
    @voiture = Voiture.new(voiture_params)

    respond_to do |format|
      if @voiture.save
        format.html { redirect_to voiture_url(@voiture), notice: "Voiture was successfully created." }
        format.json { render :show, status: :created, location: @voiture }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @voiture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /voitures/1 or /voitures/1.json
  def update
    respond_to do |format|
      if @voiture.update(voiture_params)
        format.html { redirect_to voiture_url(@voiture), notice: "Voiture was successfully updated." }
        format.json { render :show, status: :ok, location: @voiture }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @voiture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voitures/1 or /voitures/1.json
  def destroy
    @voiture.destroy

    respond_to do |format|
      format.html { redirect_to voiture_path, notice: "Voiture was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def current_user_car
    @voitures = Voiture.where(user_id: current_user.id)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voiture
      @voiture = Voiture.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def voiture_params
      params.require(:voiture).permit(:marque, :modele, :annee, :description, :annee, :prix, :user_id, :photo, :image)
    end
end
