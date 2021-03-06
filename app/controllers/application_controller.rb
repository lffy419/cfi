class ApplicationController < ActionController::Base
  include InheritedResources::DSL

  include SslRequirement
  def ssl_required?
    Rails.env == 'production' || Rails.env == 'staging'
  end

  protect_from_forgery
  before_filter :authenticate_user!
  helper :all
end
