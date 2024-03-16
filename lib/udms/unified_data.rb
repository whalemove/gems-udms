module Udms
  class UnifiedData < ActiveResource::Base
    self.site = SERVICE_CONFIG['lums_rws']
    self.element_name = ""
    self.prefix = "/api/v1/unified_data_api"

    def self.get_unified_data key
      response = ""
      begin
        if key.blank?
          return response
        else
          response = Cache.read(key)
          Log.debug "get_unified_data from cache, key: #{key}, response #{response}"
        end
      rescue Exception => e
        Log.error e
      end

      if response.blank?
        params = {'key' => key}
        result = self.get('get_unified_data', params)
        response = result["#{key}"] if result["#{key}"].present?
        Log.info "get_unified_data from database, params:#{params}, response:#{result}"
      end

      return response
    end

  end
end
