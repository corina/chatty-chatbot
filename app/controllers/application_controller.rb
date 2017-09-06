class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
  def authenticate
    if ENV['RAILS_ENV'] != 'test'
      authenticate_or_request_with_http_basic do |admin, password|
        admin == ADMIN_ID && password == PASSWORD
      end
    end
  end

end
