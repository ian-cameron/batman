class Project < ActiveRecord::Base
  has_many :deployments
  belongs_to :client
end
