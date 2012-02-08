class Job
  def initialize(data)
    if data.is_a?(Hash)
      @hash = data
      enqeue!
    elsif data.is_a?(Beanstalk::Job)
      @job = data
      @hash = JSON.parse(data.body).symbolize_keys
      perform!
    end
  end

  def perform!
    klass  = @hash[:model].constantize

    obj_id = @hash[:id]

    if obj_id.present?
      obj = Job.heavy_find(klass, obj_id)
    else
      obj = klass
    end

    action = @hash[:action]
    params = @hash[:params]

    if params
      obj.send(action,params)
    else
      obj.send(action)
    end

    @job.delete
  end

  def enqeue!
    BEANSTALK.put @hash.to_json
  end

  def self.heavy_find(klass, kid)
    10.times do
      obj = klass.find_by_id(kid)
      return obj if obj.present?
    end
    klass.find(kid)
  end
      
end
