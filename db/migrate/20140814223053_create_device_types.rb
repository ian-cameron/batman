class CreateDeviceTypes < ActiveRecord::Migration
  def change
    create_table :device_types do |t|
      t.string :name
      t.string :brand
      t.text :notes

      t.timestamps
    end
  end
end
