class Admin::TourDetailsController < Admin::AdminsController
  before_action :load_tour_detail, only: [:update, :destroy, :edit]
  before_action :load_tour_place_employee, except: [:show, :destroy]
  before_action :load_tour_show, only: :show

  def new
    @tour_detail = TourDetail.new
  end

  def index; end

  def show; end

  def create
    @tour_detail = TourDetail.new tour_detail_params
    if @tour_detail.save
      flash[:success] = t ".create_success"
    else
      flash[:danger] = t ".create_fail"
    end
    redirect_to admin_tour_details_path
  end


  def update
    if @tour_detail.update_attributes tour_detail_params
      flash[:success] = t ".update_success"
    else
      flash[:danger] = t ".update_fail"
    end
    redirect_to admin_tour_details_path
  end

  def destroy
    if @tour_detail.destroy
      flash[:success] = t ".destroy_success"
    else
      flash[:danger] = t ".destroy_fail"
    end
    redirect_to admin_tour_details_path
  end

  private

    def new_tour_detail
      @tour_detail = TourDetail.new
    end

    def load_tour_detail
      @tour_detail = TourDetail.find_by id: params[:id]
      return if @tour_detail
      flash[:danger] = t ".cant_find"
      redirect_to admin_tour_details_path
    end

    def load_tour_show
      @tour_detail = TourDetail.find_by tour_id: params[:id]
      return if @tour_detail
      flash[:danger] = t ".cant_find"
      redirect_to new_admin_tour_detail_path
    end

    def load_tour_place_employee
      @tours = Tour.select :id, :name
      @places = Place.select :id, :name
      @employees = Employee.select :id, :name
    end


    def tour_detail_params
      params.require(:tour_detail).permit :tour_id, :employee_id, :place_id,
        :start_day, :end_day
    end
end
