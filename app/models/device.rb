class Device < ActiveRecord::Base
  belongs_to :client
  belongs_to :device_type
  has_many :projects, through: :deployments
  
  scope :by_client, lambda { |current_client| 
     where(:client => current_client) }
end
