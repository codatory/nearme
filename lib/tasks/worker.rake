task :worker => :environment do

  loop do
    print 'Waiting for job...'
    Job.new(Job::BEANSTALK.reserve)
    puts '...done!'
  end

end
