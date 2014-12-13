class WelcomeController < ApplicationController
  def index
    @devices=Device.available.by_client(current_client)
    @projects=Project.includes(:deployments).by_client(current_client)
  end
end
