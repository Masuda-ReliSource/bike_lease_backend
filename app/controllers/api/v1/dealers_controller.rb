# frozen_string_literal: true

module Api
  module V1
    # Dealer API
    class DealersController < ApplicationController
      def create
        if @current_user.class.name.to_s == 'Dealer'
          render json: failed_response('Dealer can not create dealer'), status: :forbidden
        end
        dealer = Dealer.create!(dealer_params.merge!(admin_user_id: @current_user.id,
                                                     status: :active))
        render json: UserSerializer.new(dealer).serialized_json, status: :created
      rescue StandardError => e
        Rails.logger.error("Dealer create API failed: #{e.message}")
        render json: failed_response(e.message), status: :internal_server_error
      end

      private

      def dealer_params
        params.require(:dealer).permit(
          :name,
          :email,
          :password,
          :phone
        )
      end
    end
  end
end
