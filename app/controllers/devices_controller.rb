class DevicesController < ApplicationController
  def new
    @device = Device.new
  end

  def create
    @device = Device.new(device_params)
    @device.client=current_client
    if @device.save
      redirect_to root_url, :notice => "Battery Added!"
    else
      render "new"
    end
  end
  
  def edit
    @device=Device.find(params[:id])
  end
  
  def update
    @device=Device.find(params[:id])
    if @device.update_attributes(device_params)
      redirect_to root_url, notice: "Battery info updated." 
    else
      render 'edit'
    end
  end
  
  private
  
  def device_params
    params.require(:device).permit(:name, :purchased_on, :retired_on, :type_id, :notes, :voltage)
  end
end
