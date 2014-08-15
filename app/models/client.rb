class Client < ActiveRecord::Base
  has_many :devices
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  
  def self.authenticate(password)
      client = find_by_password(password)
      if client
        client
      else
        sleep(3.0)
        nil
      end
  end
    
end
