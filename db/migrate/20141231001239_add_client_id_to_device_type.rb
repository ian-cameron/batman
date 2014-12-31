class AddClientIdToDeviceType < ActiveRecord::Migration
  def change
    add_column :device_types, :client_id, :integer
  end
end
