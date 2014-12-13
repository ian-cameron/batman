class Deployment < ActiveRecord::Base
  belongs_to :project
  belongs_to :device
  belongs_to :client
  
  validates :device_id, uniqueness: { conditions: -> { where('end_date IS NULL') },
            message: "Already Deployed!"}
  
  scope :active, -> {where('end_date IS NULL')}

end
