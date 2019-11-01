# typed: strict
require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Wallet
  class Application < Rails::Application
    config.load_defaults 5.0
    config.autoload_paths += %w(app/decorators app/services/ app/types app/queries)
  end
end
