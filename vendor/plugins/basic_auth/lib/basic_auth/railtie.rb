require 'basic_auth/helpers'

module BasicAuth
  class Railtie < ::Rails::Railtie
    config.basic_auth = ActiveSupport::OrderedOptions.new
    config.basic_auth.auto_include_helpers = true

    initializer "basic_auth.set_auth_class" do
      Helpers.auth_class = config.basic_auth.auth_class

      if Helpers.auth_class.nil?
        raise "Please set config.basic_auth.auth_class for basic_auth to work"
      end
    end

    initializer "basic_auth.freedom_patch" do
      if config.basic_auth.auto_include_helpers
        ActiveSupport.on_load(:action_controller) do
          include Helpers
        end

        ActiveSupport.on_load(:action_view) do
          include Helpers
        end
      end
    end
  end
end
