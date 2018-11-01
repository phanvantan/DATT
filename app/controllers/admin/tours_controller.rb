class Admin::ToursController < Admin::AdminsController
  before_action :new_tour, only: :index
  before_action :load_tour, only: [:update, :destroy, :edit, :show]

  def new
    @tour = Tour.new
  end

  def index
    @q = Tour.search(params[:q])
    @tours = @q.result(distinct: true)
              .page(params[:page])
  end


  def create
    @tour = Tour.new tour_params
    if @tour.save
      @tours = Tour.all
      flash[:success] = t ".create_success"
      new_tour
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
    if @tour.update_attributes tour_params
      @tours = Tour.all
      new_tour
      flash[:success] = t ".update_success"
    else
      flash[:danger] = t ".update_fail"
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    if @tour.destroy
      @tours = Tour.all
      flash[:success] = t ".destroy_success"
    else
      flash[:danger] = t ".destroy_fail"
    end
    respond_to do |format|
      format.js
    end
  end


  private

    def new_tour
      @tour = Tour.new
    end

    def load_tour
      @tour = Tour.find_by id: params[:id]
      return if @tour
      flash[:danger] = t ".cant_fin"
      redirect_to admin_tours_path
    end

    def tour_params
      params.require(:tour).permit :name, :description, :price
    end
end
