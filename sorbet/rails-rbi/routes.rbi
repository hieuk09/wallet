# typed: strong
# This is an autogenerated file for Rails routes.
# Please run bundle exec rake rails_rbi:routes to regenerate.
class ActionController::Base
  include GeneratedUrlHelpers
end

module ActionView::Helpers
  include GeneratedUrlHelpers
end

class ActionMailer::Base
  include GeneratedUrlHelpers
end

module GeneratedUrlHelpers
  # Sigs for route /exchange_rates(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def exchange_rates_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def exchange_rates_url(*args, **kwargs); end

  # Sigs for route /exchange_rates/new(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def new_exchange_rate_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def new_exchange_rate_url(*args, **kwargs); end

  # Sigs for route /exchange_rates/:id/edit(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def edit_exchange_rate_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def edit_exchange_rate_url(*args, **kwargs); end

  # Sigs for route /exchange_rates/:id(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def exchange_rate_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def exchange_rate_url(*args, **kwargs); end

  # Sigs for route /transactions/:transaction_id/sub_transactions(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def transaction_sub_transactions_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def transaction_sub_transactions_url(*args, **kwargs); end

  # Sigs for route /transactions/:transaction_id/sub_transactions/new(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def new_transaction_sub_transaction_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def new_transaction_sub_transaction_url(*args, **kwargs); end

  # Sigs for route /transactions/:transaction_id/sub_transactions/:id/edit(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def edit_transaction_sub_transaction_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def edit_transaction_sub_transaction_url(*args, **kwargs); end

  # Sigs for route /transactions/:transaction_id/sub_transactions/:id(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def transaction_sub_transaction_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def transaction_sub_transaction_url(*args, **kwargs); end

  # Sigs for route /transactions/:id/ignore(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def ignore_transaction_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def ignore_transaction_url(*args, **kwargs); end

  # Sigs for route /transactions(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def transactions_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def transactions_url(*args, **kwargs); end

  # Sigs for route /transactions/new(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def new_transaction_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def new_transaction_url(*args, **kwargs); end

  # Sigs for route /transactions/:id/edit(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def edit_transaction_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def edit_transaction_url(*args, **kwargs); end

  # Sigs for route /transactions/:id(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def transaction_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def transaction_url(*args, **kwargs); end

  # Sigs for route /categories(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def categories_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def categories_url(*args, **kwargs); end

  # Sigs for route /categories/new(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def new_category_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def new_category_url(*args, **kwargs); end

  # Sigs for route /categories/:id/edit(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def edit_category_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def edit_category_url(*args, **kwargs); end

  # Sigs for route /categories/:id(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def category_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def category_url(*args, **kwargs); end

  # Sigs for route /accounts(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def accounts_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def accounts_url(*args, **kwargs); end

  # Sigs for route /accounts/new(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def new_account_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def new_account_url(*args, **kwargs); end

  # Sigs for route /accounts/:id/edit(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def edit_account_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def edit_account_url(*args, **kwargs); end

  # Sigs for route /accounts/:id(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def account_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def account_url(*args, **kwargs); end

  # Sigs for route /transfer_transactions(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def transfer_transactions_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def transfer_transactions_url(*args, **kwargs); end

  # Sigs for route /transfer_transactions/new(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def new_transfer_transaction_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def new_transfer_transaction_url(*args, **kwargs); end

  # Sigs for route /imports(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def imports_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def imports_url(*args, **kwargs); end

  # Sigs for route /imports/new(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def new_import_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def new_import_url(*args, **kwargs); end

  # Sigs for route /imports/:id(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def import_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def import_url(*args, **kwargs); end

  # Sigs for route /reports/transactions(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def transactions_reports_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def transactions_reports_url(*args, **kwargs); end

  # Sigs for route /reports/categories(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def categories_reports_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def categories_reports_url(*args, **kwargs); end

  # Sigs for route /reports/burn_rate(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def burn_rate_reports_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def burn_rate_reports_url(*args, **kwargs); end

  # Sigs for route /reports/runway(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def runway_reports_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def runway_reports_url(*args, **kwargs); end

  # Sigs for route /
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def root_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def root_url(*args, **kwargs); end

  # Sigs for route /rails/action_mailbox/postmark/inbound_emails(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_postmark_inbound_emails_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_postmark_inbound_emails_url(*args, **kwargs); end

  # Sigs for route /rails/action_mailbox/relay/inbound_emails(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_relay_inbound_emails_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_relay_inbound_emails_url(*args, **kwargs); end

  # Sigs for route /rails/action_mailbox/sendgrid/inbound_emails(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_sendgrid_inbound_emails_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_sendgrid_inbound_emails_url(*args, **kwargs); end

  # Sigs for route /rails/action_mailbox/mandrill/inbound_emails(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_mandrill_inbound_health_check_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_mandrill_inbound_health_check_url(*args, **kwargs); end

  # Sigs for route /rails/action_mailbox/mandrill/inbound_emails(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_mandrill_inbound_emails_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_mandrill_inbound_emails_url(*args, **kwargs); end

  # Sigs for route /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_mailgun_inbound_emails_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_mailgun_inbound_emails_url(*args, **kwargs); end

  # Sigs for route /rails/conductor/action_mailbox/inbound_emails(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_conductor_inbound_emails_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_conductor_inbound_emails_url(*args, **kwargs); end

  # Sigs for route /rails/conductor/action_mailbox/inbound_emails/new(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def new_rails_conductor_inbound_email_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def new_rails_conductor_inbound_email_url(*args, **kwargs); end

  # Sigs for route /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def edit_rails_conductor_inbound_email_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def edit_rails_conductor_inbound_email_url(*args, **kwargs); end

  # Sigs for route /rails/conductor/action_mailbox/inbound_emails/:id(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_conductor_inbound_email_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_conductor_inbound_email_url(*args, **kwargs); end

  # Sigs for route /rails/conductor/action_mailbox/inbound_emails/sources/new(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def new_rails_conductor_inbound_email_source_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def new_rails_conductor_inbound_email_source_url(*args, **kwargs); end

  # Sigs for route /rails/conductor/action_mailbox/inbound_emails/sources(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_conductor_inbound_email_sources_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_conductor_inbound_email_sources_url(*args, **kwargs); end

  # Sigs for route /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_conductor_inbound_email_reroute_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_conductor_inbound_email_reroute_url(*args, **kwargs); end

  # Sigs for route /rails/active_storage/blobs/redirect/:signed_id/*filename(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_service_blob_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_service_blob_url(*args, **kwargs); end

  # Sigs for route /rails/active_storage/blobs/proxy/:signed_id/*filename(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_service_blob_proxy_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_service_blob_proxy_url(*args, **kwargs); end

  # Sigs for route /rails/active_storage/representations/redirect/:signed_blob_id/:variation_key/*filename(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_blob_representation_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_blob_representation_url(*args, **kwargs); end

  # Sigs for route /rails/active_storage/representations/proxy/:signed_blob_id/:variation_key/*filename(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_blob_representation_proxy_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_blob_representation_proxy_url(*args, **kwargs); end

  # Sigs for route /rails/active_storage/disk/:encoded_key/*filename(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_disk_service_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_disk_service_url(*args, **kwargs); end

  # Sigs for route /rails/active_storage/disk/:encoded_token(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def update_rails_disk_service_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def update_rails_disk_service_url(*args, **kwargs); end

  # Sigs for route /rails/active_storage/direct_uploads(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_direct_uploads_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_direct_uploads_url(*args, **kwargs); end
end
