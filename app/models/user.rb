class User < ActiveRecord::Base
  has_many :recommendations, :dependent => :destroy

  geocoded_by :address

  after_create :geocode_later
  after_create :seed_initial_recommendations_later

  def seed_initial_recommendations_later
    Job.new(:model => 'User', :action => 'seed_initial_recommendations!', :id => id)
  end

  def geocode_later
    Job.new(:model => 'User', :action => 'geocode!', :id => id)
  end

  def geocode!
    geocode && save
  end

  def seed_initial_recommendations!
    PointOfInterest.near(self, 5).each do |poi|
      self.recommendations.create(:point_of_interest => poi)
    end
  end

end
