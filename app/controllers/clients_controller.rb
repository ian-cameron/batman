class ClientsController < ApplicationController
  def new
    @client = Client.new
  end

  def create
    @client = Client.new(params[:client])
    if @client.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end
  
  def edit
    @client=Client.find(params[:id])
  end
  
  def update
    @client=Client.find(params[:id])
    if @client.update_attributes(client_params)
      redirect_to root_url, notice: "Client info updated successfully" 
    else
      render 'edit'
    end
  end
  
  private
  
  def client_params
    params.require(:client).permit(:login, :name, :password, :password_confirmation)
  end
end
