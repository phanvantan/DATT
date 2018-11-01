class Admin::PlacesController < Admin::AdminsController
  before_action :new_place, only: :index
  before_action :load_place, only: [:update, :destroy, :edit, :show]

  def new
    @place = Place.new
  end

  def index
    @q = Place.search(params[:q])
    @places = @q.result(distinct: true)
              .page(params[:page])
  end


  def create
    @place = Place.new place_params
    if @place.save
      @places = Place.all
      flash[:success] = t ".create_success"
      new_place
    else
      flash[:danger] = t ".create_fail"
    end
    respond_to do |format|
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    if @place.update_attributes place_params
      @places = Place.all
      new_place
      flash[:success] = t ".update_success"
    else
      flash[:danger] = t ".update_fail"
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    if @place.destroy
      @places = Place.all
      flash[:success] = t ".destroy_success"
    else
      flash[:danger] = t ".destroy_fail"
    end
    respond_to do |format|
      format.js
    end
  end

  private

    def new_place
      @place = Place.new
    end

    def load_place
      @place = Place.find_by id: params[:id]
      return if @place
      flash[:danger] = t ".cant_fin"
      redirect_to admin_places_path
    end

    def place_params
      params.require(:place).permit :name, :address, :description, :picture
    end
end
