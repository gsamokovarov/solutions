require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Solutions
  class Application < Rails::Application
    config.basic_auth.auth_class = 'User'
  end
end
