class DeviceTypesController < ApplicationController
  def new
    @device_type = DeviceType.new
  end  
  def create
    @device_type = DeviceType.new(device_type_params)
    @device_type.client = current_client
    if @device_type.save
      redirect_to root_url, :notice => "Added new battery type!"
    else
      render "new"
    end
  end
  
  def index
    @device_types = DeviceType.all
  end
  
  def edit
    @device_type = DeviceType.find(params[:id])
  end
  
  def update
    @device_type = DeviceType.find(params[:id])
    if @device_type.update_attributes(device_type_params)
      redirect_to root_url, notice: "Battery type updated successfully" 
    else
      render 'edit'
    end
  end
  
  private
  
  def device_type_params
    params.require(:device_type).permit(:name, :brand, :notes)
  end
end
