# typed: false

class ApplicationController < ActionController::Base
  extend T::Sig
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  sig { params(params: ActionController::Parameters, resource_name: Symbol).returns(ActionController::Parameters) }
  def safe_params_require(params, resource_name)
    resource_params = params.require(resource_name)

    if resource_params.is_a?(ActionController::Parameters)
      resource_params
    else
      ActionController::Parameters.new({})
    end
  end
end
