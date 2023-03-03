class BikeLeaseSerializer
  include FastJsonapi::ObjectSerializer
  attributes :leese, :closee, :down_payment, :lease_status, :approved_at, :created_at, :updated_at
end
