class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.integer :user_id
      t.integer :point_of_interest_id

      t.timestamps
    end
  end
end
