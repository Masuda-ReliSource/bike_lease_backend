# frozen_string_literal: true

class BikeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :make, :model, :year, :mileage
  attribute :dealer do |object|
    {
      id: object.dealer.id,
      name: object.dealer.name,
      email: object.dealer.email,
      phone: object.dealer.phone
    }.as_json
  end
end
