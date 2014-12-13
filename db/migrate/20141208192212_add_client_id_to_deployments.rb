class AddClientIdToDeployments < ActiveRecord::Migration
  def change
    add_column :deployments, :client_id, :integer
  end
end
