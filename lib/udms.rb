# encoding: utf-8
require "yaml"
require "json"
require "udms/version"
require "active_resource"
require "udms/env"
require "udms/service_endpoint"
require "udms/unified_data"
require "udms/redis_client"

module Udms
  UDMS_REDIS_CLIENT = init_redis_client
end
