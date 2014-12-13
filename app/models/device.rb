class Device < ActiveRecord::Base
  belongs_to :client
  belongs_to :device_type, foreign_key: :type_id
  has_many :projects, through: :deployments
  has_many :deployments
  
  scope :by_client, lambda { |current_client| 
     where(:client => current_client) 
  }
  scope :available, -> {
      where('id NOT IN (SELECT DISTINCT(device_id) FROM deployments WHERE end_date IS NULL)') 
  }

end
