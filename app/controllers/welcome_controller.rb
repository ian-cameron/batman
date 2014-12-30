class WelcomeController < ApplicationController
  def index
    @devices=Device.available.by_client(current_client)
    @projects=Project.active.by_client(current_client)
  end
end
