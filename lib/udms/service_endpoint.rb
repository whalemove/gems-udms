module Udms
  class ServiceEndpoint < ActiveResource::Base
    self.site = SERVICE_CONFIG['lums_rws']
    self.element_name = ""
    self.prefix = "/api/v1/service_endpoints"

    def self.get_service_endpoints
      begin
        response = {'return_code'=>0, 'return_info'=>'success'}
        response['service_endpoints'] = UDMS_REDIS_CLIENT.read('service_endpoints')
        if response['service_endpoints'].blank?
          response = self.get('get_service_endpoints')
        end
      rescue Exception => e
        Log.error e
        response = self.get('get_service_endpoints')
      end
      return response
    end

    #init service_endpoints in different services
    def self.init_service_endpoints service_endpoint_file
      begin
        if Rails.env == DEVELOPMENT || Rails.env == TEST
          Log.info "init_service_endpoints by local file : #{service_endpoint_file}"
          service_endpoint = YAML.load_file(service_endpoint_file)[Rails.env]
        else
          rtn = get_service_endpoints
          if rtn["return_code"] == SUCCESS && rtn["service_endpoints"].present?
            service_endpoint = rtn["service_endpoints"]
            Log.info "init_service_endpoints by lums,service_endpoints:#{service_endpoint}"
          else
            Log.error "init_service_endpoints by lums error,return_info:#{rtn}"
            service_endpoint = nil
          end
        end
      rescue Exception => e
        Log.error e
        service_endpoint = nil
      end
      service_endpoint
    end
  end
end
