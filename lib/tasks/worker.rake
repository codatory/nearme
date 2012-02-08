task :worker => :environment do

  loop do
    print 'Waiting for job...'
    Job.new(BEANSTALK.reserve)
    puts '...done!'
  end

end
