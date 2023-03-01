# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authorize_user
  def failed_response(message)
    {
      data: nil,
      message: message,
    }
  end

  protected

  def authorize_user
    header = request.headers['Authorization']
    token = header.split(' ').last if header
    begin
      @current_user = AdminUser.find_by(auth_token: token) ||
                      Dealer.find_by(auth_token: token)
      unless @current_user.present?
        render json: failed_response('Authentication error!'), status: :unauthorized
      end
    end
  end
end
