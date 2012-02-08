class PointOfInterest < ActiveRecord::Base
  has_many :recommendations, :dependent => :destroy

  geocoded_by :address

  after_create :geocode_later
  after_create :recommend_to_nearby_people_later

  def close!
    recommendations.destroy_all
  end

  def recommend_to_nearby_people!
    User.near(self, 5).each do |u|
      u.recommendations.create(:point_of_interest => self)
    end
  end

  def recommend_to_nearby_people_later
    Job.new(:model => 'PointOfInterest', :action => 'recommend_to_nearby_people!', :id => id)
  end

  def geocode_later
    Job.new(:model => 'PointOfInterest', :action => 'geocode!', :id => id)
  end

  def geocode!
    geocode && save
  end

end
