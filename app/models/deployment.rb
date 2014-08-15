class Deployment < ActiveRecord::Base
  belongs_to :project
  belongs_to :device
end
