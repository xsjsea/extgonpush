require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Gonpush
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Google rails 5 custom fonts
    # http://aravin.net/add-custom-fonts-rails-application/
    # Don't forget to restart the rails server after changing the config file!
    config.assets.paths << Rails.root.join("app", "assets", "font-awesome")
    config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/
    config.active_record.default_timezone = :local
    config.time_zone = 'Beijing'
    
  end
end
