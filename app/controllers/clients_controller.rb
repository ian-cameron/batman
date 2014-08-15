class ClientsController < ApplicationController
  def new
    @client = User.new
  end

  def create
    @client = User.new(params[:user])
    if @client.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end
  
end
