class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_client, :admin

  private

  def current_client
    @current_client ||= Client.find(session[:client_id]) if session[:client_id]
  end
  
  def admin
    current_client.admin?
  end
end
