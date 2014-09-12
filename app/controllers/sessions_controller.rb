class SessionsController < ApplicationController
  def new
  end

  def create
    client = Client.authenticate(params[:login], params[:password])
    if client
      session[:client_id] = client.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:client_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
