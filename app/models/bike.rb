# frozen_string_literal: true

# Bike class
class Bike < ApplicationRecord
  # Association
  belongs_to :dealer

  # Enum
  enum mileage: { '60-70': 0,
                  '70-80': 1,
                  '80-90': 2 }

  # Validation
  validates_uniqueness_of :dealer_id, scope: %i[make mileage year]
end
