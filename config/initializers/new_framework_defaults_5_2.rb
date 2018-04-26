# Be sure to restart your server when you modify this file.
#
# This file contains migration options to ease your Rails 5.2 upgrade.
#
# Once upgraded flip defaults one by one to migrate to the new default.
#
# Read the Guide for Upgrading Ruby on Rails for more info on each option.

# Make Active Record use stable #cache_key alongside new #cache_version method.
# This is needed for recyclable cache keys.
# Rails.application.config.active_record.cache_versioning = true

Rails.application.config.action_dispatch.use_authenticated_cookie_encryption = true
Rails.application.config.active_support.use_authenticated_message_encryption = true
Rails.application.config.action_controller.default_protect_from_forgery = true
Rails.application.config.active_support.use_sha1_digests = true
