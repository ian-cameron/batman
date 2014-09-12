class AddDeployedInToDeployments < ActiveRecord::Migration
  def change
    add_column :deployments, :deployed_in, :string
  end
end
