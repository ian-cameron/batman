class Device < ActiveRecord::Base
  belongs_to :client
  belongs_to :device_type
  has_many :projects, through: :deployments
end
