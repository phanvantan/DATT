class UserToursController < ApplicationController
  before_action :set_user_tour, only: [:show, :edit, :update, :destroy]

  # GET /user_tours
  # GET /user_tours.json
  def index
    @user_tours = UserTour.all
  end

  # GET /user_tours/1
  # GET /user_tours/1.json
  def show
  end

  # GET /user_tours/new
  def new
    @user_tour = UserTour.new
  end

  # GET /user_tours/1/edit
  def edit
  end

  # POST /user_tours
  # POST /user_tours.json
  def create
    @user_tour = UserTour.new(user_tour_params)

    respond_to do |format|
      if @user_tour.save
        format.html { redirect_to @user_tour, notice: 'User tour was successfully created.' }
        format.json { render :show, status: :created, location: @user_tour }
      else
        format.html { render :new }
        format.json { render json: @user_tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_tours/1
  # PATCH/PUT /user_tours/1.json
  def update
    respond_to do |format|
      if @user_tour.update(user_tour_params)
        format.html { redirect_to @user_tour, notice: 'User tour was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_tour }
      else
        format.html { render :edit }
        format.json { render json: @user_tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_tours/1
  # DELETE /user_tours/1.json
  def destroy
    @user_tour.destroy
    respond_to do |format|
      format.html { redirect_to user_tours_url, notice: 'User tour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_tour
      @user_tour = UserTour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_tour_params
      params.require(:user_tour).permit(:user_id, :tour_id)
    end
end
