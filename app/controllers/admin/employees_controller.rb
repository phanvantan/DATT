class Admin::EmployeesController < Admin::AdminsController
  before_action :new_employee, only: :index
  before_action :load_employee, only: [:update, :destroy, :edit, :show]

  def new
    @employee = Employee.new
  end

  def index
    @q = Employee.search(params[:q])
    @employees = @q.result(distinct: true)
              .page(params[:page])
  end


  def create
    @employee = Employee.new employee_params
    if @employee.save
      @employees = Employee.all
      flash[:success] = t ".create_success"
      new_employee
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
    if @employee.update_attributes employee_params
      @employees = Employee.all
      new_employee
      flash[:success] = t ".update_success"
    else
      flash[:danger] = t ".update_fail"
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    if @employee.destroy
      @employees = Employee.all
      flash[:success] = t ".destroy_success"
    else
      flash[:danger] = t ".destroy_fail"
    end
    respond_to do |format|
      format.js
    end
  end

  private

    def new_employee
      @employee = Employee.new
    end

    def load_employee
      @employee = Employee.find_by id: params[:id]
      return if @employee
      flash[:danger] = t ".cant_fin"
      redirect_to admin_employees_path
    end

    def employee_params
      params.require(:employee).permit :name, :position, :address, :phone_number
    end
end
