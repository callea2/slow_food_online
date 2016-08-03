class ApiController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :null_session
  respond_to :json

  before_action :destroy_session

  def destroy_session
    request.session_options[:skip] = true
  end
end
