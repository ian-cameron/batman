class AddArchivedToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :archived, :bool, default: false
  end
end
