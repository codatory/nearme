class CreatePointOfInterests < ActiveRecord::Migration
  def change
    create_table :point_of_interests do |t|
      t.string :address
      t.string :name
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
