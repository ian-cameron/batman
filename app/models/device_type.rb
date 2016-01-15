class DeviceType < ActiveRecord::Base
  has_many :devices
  belongs_to :client
  
  def make_and_model
    self.brand+' '+self.name
  end
end
