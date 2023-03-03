class BikeLeaseSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :leese, :closee, :down_payment,
             :lease_status, :approved_at, :created_at, :updated_at
  attribute :dealer_name do |object|
    object.dealer.name
  end
  attribute :bike do |object|
    "#{object.bike.model} #{object.bike.make} #{object.bike.year}"
  end
end
