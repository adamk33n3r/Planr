class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :name
      t.datetime :due
      t.integer :level
      t.references :user, index: true

      t.timestamps
    end
  end
end
