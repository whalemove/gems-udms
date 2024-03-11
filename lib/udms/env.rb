module Udms
  module Env
    GEM_ROOT_PATH = File.dirname(__FILE__) + "/../.."
  end

  SERVICE_CONFIG = YAML::load(File.read("#{Udms::Env::GEM_ROOT_PATH}/service_configuration.yml"))[Rails.env]

  SUCCESS = 0
  DEVELOPMENT = "development"
  TEST        = "test"
end
