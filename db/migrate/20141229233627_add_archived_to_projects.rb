class AddArchivedToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :archived, :boolean
  end
end
