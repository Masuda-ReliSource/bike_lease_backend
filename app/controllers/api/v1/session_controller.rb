# frozen_string_literal: true

module Api
  module V1
    # Login class
    class SessionController < ApplicationController
      skip_before_action :authorize_user, only: [:create]
      def create
        user = find_user(params)
        if user&.authenticate(params[:password])
          render json: UserSerializer.new(user).serialized_json, status: :ok
        else
          render json: failed_response('Email or Password is wrong!'), status: :unauthorized
        end
      rescue StandardError => e
        Rails.logger.error("Authentication API failed: #{e.message}")
        render json: failed_response(e.message), status: :internal_server_error
      end

      private

      def find_user(params)
        AdminUser.find_by(email: params[:email]) || Dealer.find_by(email: params[:email])
      end
    end
  end
end
