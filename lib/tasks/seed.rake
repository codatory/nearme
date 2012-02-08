task :seed => :environment do
  starts = Time.now
  
  pois = [
    {:address => '701 Congressional Blvd., Carmel, IN 46032', :name => 'nFrame'},
    {:address => '12525 Old Meridian St, 46032', :name => 'Brockway Pub'},
    {:address => '1424 W Carmel Dr, 46032',      :name => 'Meijer'},
    {:address => '355 City Center Drive Carmel, IN 46032', :name => 'Palladium'},
    {:address => '5255 Winthrop Ave, 46220',     :name => 'Developertown'},
    {:address => '842 E 65th St, Indianapolis, IN', :name => 'BroadRipple Brew Pub'}
    ]

  users = [
    {:address => '701 Congressional Blvd., 46032',  :username => 'NocDude1'},
    {:address => '12520 Old Meridian St, 46032',    :username => 'BeerGut1997'},
    {:address => '4 City Center Green, 46032',      :username => 'Codez'},
    {:address => '842 E 65th St, Indianapolis, IN', :username => 'BrewPubz'}
    ]

  pois.each{|p| PointOfInterest.create(p)}
  users.each{|u| User.create(u)}

  done = Time.now

  puts "-- Created #{users.count + pois.count} records in #{starts - done} seconds."

end
