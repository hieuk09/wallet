# typed: strict

require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_view/railtie'
require 'active_support/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Wallet
  class Application < Rails::Application
    config.load_defaults 7.1
    config.autoload_paths += %w[app/decorators app/services/ app/types app/queries]
  end
end
