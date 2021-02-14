class CarsController < AuthenticateController
  before_action :find_customer
  before_action :find_car, only:[:edit,:update]
  before_action :user_check


  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.valid?
      @car.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @car.update(car_params)
      redirect_to customer_path(@customer.id)
    else
      render :edit
    end
  end

  private
  def car_params
    params.require(:car).permit(:name, :vehicle_number, :transport_bureau, :class_number, :registration_type, :registration_number, :vehicle_inspection_day, :registered_year).merge(customer_id: params[:customer_id])
  end

  def find_customer
    @customer = Customer.find(params[:customer_id])
  end

  def find_car
    @car = Car.find(params[:id])
  end

  def user_check
    redirect_to customer_path(@customer.id) if current_user.id != @customer.user.id
  end
end
