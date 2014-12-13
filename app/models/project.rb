class Project < ActiveRecord::Base
  has_many :deployments
  has_many :devices, through: :deployments
  belongs_to :client
  
  scope :by_client, lambda { |current_client| 
     where(:client => current_client) }
end
