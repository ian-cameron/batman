class CreateDeployments < ActiveRecord::Migration
  def change
    create_table :deployments do |t|
      t.integer :project_id
      t.integer :device_id
      t.datetime :start_date
      t.datetime :end_date
      t.float :start_voltage
      t.float :end_voltage

      t.timestamps
    end
  end
end
