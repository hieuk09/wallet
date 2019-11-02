# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strong
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/factory_bot_rails/all/factory_bot_rails.rbi
#
# factory_bot_rails-5.1.1
module FactoryBotRails
end
module FactoryBotRails::Generators
end
class FactoryBotRails::Generators::RSpecGenerator
  def factory_bot_directory; end
  def factory_bot_options; end
  def fixture_replacement_setting; end
  def initialize(generators); end
  def run; end
end
class FactoryBotRails::Generators::NonRSpecGenerator
  def initialize(generators); end
  def run; end
  def test_framework; end
end
class FactoryBotRails::Generators::NullGenerator
  def initialize(generators); end
  def run; end
end
class FactoryBotRails::Generator
  def factory_bot_disabled?; end
  def generator; end
  def initialize(config); end
  def rails_options; end
  def run; end
  def test_framework; end
end
class FactoryBotRails::DefinitionFilePaths
  def any?; end
  def directories; end
  def files; end
  def initialize(definition_file_paths); end
end
class FactoryBotRails::Reloader
  def app; end
  def build_reloader; end
  def config; end
  def initialize(app, config); end
  def register_reloader(reloader); end
  def reloader_class; end
  def run; end
end
class FactoryBotRails::Railtie < Rails::Railtie
  def definition_file_paths; end
end
