# frozen_string_literal: true

module Api
  module V1
    class AdminUsersController < ApplicationController
      def create
        admin = AdminUser.create!(
          admin_user_param.merge!(created_by: @current_user.id,
                                  status: :active,
                                  role_type: :admin))
        render json: UserSerializer.new(admin).serialized_json, status: :created
      rescue StandardError => e
        Rails.logger.error("Authentication API failed: #{e.message}")
        render json: failed_response(e.message), status: :internal_server_error
      end

      private

      def admin_user_param
        params.require(:admin).permit(
          :name,
          :email,
          :password,
          :phone
        )
      end
    end
  end
end
