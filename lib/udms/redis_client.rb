module Udms
  def self.init_redis_client
    redis_settings = YAML.load(ERB.new(File.read("#{Udms::Env::GEM_ROOT_PATH}/lums_redis.yml")).result)[Rails.env]
    redis_settings = redis_settings.map{|array|
      array[0]=array[0].to_sym
      array
    }.to_h
    ActiveSupport::Cache::RedisStore.new(redis_settings)
  end
end
