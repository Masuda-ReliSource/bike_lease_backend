# frozen_string_literal: true

module Api
  module V1
    # Bike Lease API
    class BikeLeasesController < ApplicationController
      def index
        bike_leases = BikeLease.order(id: :desc)
        render json: BikeLeaseSerializer.new(bike_leases).serialized_json, status: :ok
      rescue StandardError => e
        Rails.logger.error("Bike lease create API failed: #{e.message}")
        render json: failed_response(e.message), status: :internal_server_error
      end
      def create
        if @current_user.class.name.to_s == 'AdminUser'
          render json: failed_response('Admin can not initiate lease'), status: :forbidden
        end
        bike_lease = BikeLease.create!(bike_lease_params.merge!(dealer_id: @current_user.id))
        render json: BikeLeaseSerializer.new(bike_lease).serialized_json, status: :created
      rescue StandardError => e
        Rails.logger.error("Bike lease create API failed: #{e.message}")
        render json: failed_response(e.message), status: :internal_server_error
      end

      def approve
        lease_application = BikeLease.find(params[:id])
        lease_application.update!(lease_status: :approved,
                                  approved_at: Time.now,
                                  admin_user_id: @current_user.id)
        render json: { message: 'Request is approved successfully.' },
               status: :ok
      rescue StandardError => e
        Rails.logger.error("Bike lease approve API failed: #{e.message}")
        render json: failed_response(e.message), status: :internal_server_error
      end

      private

      def bike_lease_params
        params.require(:bike_lease).permit(
          :down_payment,
          :bike_id,
          leese: %i[name address phone monthly_income dob],
          closee: %i[name address phone monthly_income dob]
        )
      end
    end
  end
end
