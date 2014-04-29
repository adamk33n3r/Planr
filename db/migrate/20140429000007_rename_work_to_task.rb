class RenameWorkToTask < ActiveRecord::Migration
  def change
    rename_table :works, :tasks
  end
end
