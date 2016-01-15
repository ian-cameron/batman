class DevicesController < ApplicationController
  def index
    @devices=Device.by_client(current_client)
  end
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
      respond_to do |format|
        format.html { redirect_to devices_url, notice: "Battery info updated." }
        format.js
      end
    else
      render 'edit'
    end
  end
  
  def destroy
    @device=Device.find(params[:id])
    if @device.destroy
      redirect_to root_path, notice: "Battery Deleted!"
    else
      redirect_to :back
    end
  end
  
  private
  def device_params
    params.require(:device).permit(:name, :purchased_on, :retired_on, :type_id, :notes, :voltage, :archived, deployments_attributes: [:id, :start_date, :deployed_in])
  end
end
