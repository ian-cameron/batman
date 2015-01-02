class Client < ActiveRecord::Base
  has_many :devices
  has_many :device_types
  has_many :deployments
  has_many :projects
  validates_confirmation_of :password
  validates_uniqueness_of :login
  validates_presence_of [:password, :login]
  
  def self.authenticate(login, password)
      client = find_by "LOWER(login) LIKE ?", login.downcase
      if client && client.password.downcase == password.downcase
        client
      else
        sleep(3.0)
        nil
      end
  end
    
end
