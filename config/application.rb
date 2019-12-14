require_relative 'boot'

require 'rails/all'
require "google/cloud/translate"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EGo
  class Application < Rails::Application
    config.load_defaults 5.2
    config.before_configuration do #<=ここから
     env_file = File.join(Rails.root, 'config', 'local_env.yml')
     YAML.load(File.open(env_file)).each do |key, value|
       ENV[key.to_s] = value
     end if File.exists?(env_file) #<=ここまで
    end
  end
end
