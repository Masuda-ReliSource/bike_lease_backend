# frozen_string_literal: true

module Api
  module V1
    # Bike API
    class BikesController < ApplicationController
      def index
        bikes = Bike.where(dealer_id: @current_user.id).order(id: :desc)
        render json: BikeSerializer.new(bikes).serialized_json, status: :ok
      rescue StandardError => e
        Rails.logger.error("Bike index API failed: #{e.message}")
        render json: failed_response(e.message), status: :internal_server_error
      end
      def create
        if @current_user.class.name.to_s == 'AdminUser'
          render json: failed_response('Admin can not create dealer'), status: :forbidden
        end
        bike = Bike.create!(bike_params.merge!(dealer_id: @current_user.id))
        render json: BikeSerializer.new(bike).serialized_json, status: :created
      rescue StandardError => e
        Rails.logger.error("Bike create API failed: #{e.message}")
        render json: failed_response(e.message), status: :internal_server_error
      end

      private

      def bike_params
        params.require(:bike).permit(
          :make,
          :model,
          :year,
          :mileage
        )
      end
    end
  end
end
