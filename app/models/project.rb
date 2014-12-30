class Project < ActiveRecord::Base
  has_many :deployments
  has_many :devices, through: :deployments
  has_many :active_deployments, -> {where(end_date: nil)}, class_name: 'Deployment'
  belongs_to :client
  
  scope :by_client, lambda { |current_client| 
     where(:client => current_client) }
  
  scope :active, -> { where(archived: false||nil)}
end
