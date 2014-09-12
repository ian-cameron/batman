class Client < ActiveRecord::Base
  has_many :devices
  validates_confirmation_of :password
  validates_uniqueness_of :login
  validates_presence_of :password, :on => :create
  
  def self.authenticate(login, password)
      client = find_by_login(login)
      if client.password == password
        client
      else
        sleep(3.0)
        nil
      end
  end
    
end
