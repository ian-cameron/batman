class DeploymentsController < ApplicationController
  def index
    @deployments=Deployment.by_client(current_client)
  end
  def new
    @deployment = Deployment.new
  end

  def create
    @deployment = Deployment.new(deployment_params)
    @deployment.client=current_client
    @deployment.start_date = Time.now
    @deployment.save!
    @message = "New deployment saved."   
    respond_to do |format|
      format.html { redirect_to root_url, notice: "Battery info updated." }
      format.js
    end
    rescue ActiveRecord::RecordInvalid
     # @message = "#{@deployment.errors}"
      respond_to do |format|
        format.html { redirect_to root_url, notice: "Battery info updated." }
        format.js
      end
  end
  
  
  def edit
    @deployment=Deployment.find(params[:id])
    @deployment.end_voltage=natural_battery_drain(@deployment)
  end
  
  def update
    @deployment=Deployment.find(params[:id])
    if @deployment.update_attributes(deployment_params)
      update_battery_status(@deployment)
      respond_to do |format|
        format.html { redirect_to root_url, notice: "Battery info updated." }
        format.js
      end
    else
      render 'edit'
    end
  end
  
  def destroy
    @deployment=Deployment.find(params[:id])
    if @deployment.destroy
      redirect_to root_path, notice: "Battery Deleted!"
    else
      redirect_to :back
    end
  end
  
  private
  def deployment_params
    params.require(:deployment).permit(:project_id, :device_id, :start_date, :end_date, :start_voltage, :end_voltage, :deployed_in)
  end
  
  def natural_battery_drain(deployment)
    (10.0*[(deployment.start_voltage - ((Time.now - deployment.start_date)/84600)*0.2), 11.6].max).round/10.0
  end
  
  def update_battery_status(deployment)
    if deployment.end_voltage != deployment.device.voltage
      deployment.device.update_attributes(voltage: deployment.end_voltage)
    end
  end
end
