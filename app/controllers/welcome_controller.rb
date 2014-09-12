class WelcomeController < ApplicationController
  def index
    @devices=Device.by_client(current_client)
    @projects=Project.by_client(current_client)
  end
end
