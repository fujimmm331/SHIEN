class CarsController < AuthenticateController
  def new
    @car = Car.new
    @customer = Customer.find(params[:customer_id])
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @car = Car.new(car_params)
    if @car.valid?
      @car.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def car_params
    params.require(:car).permit(:name, :vehicle_number, :transport_bureau, :class_number, :registration_type, :registration_number, :vehicle_inspection_day, :registered_year).merge(customer_id: params[:customer_id])
  end
end
