class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.integer :client_id
      t.integer :type_id
      t.string :name
      t.datetime :purchased_on
      t.datetime :retired_on
      t.text :notes
      t.float :voltage

      t.timestamps
    end
  end
end
