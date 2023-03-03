class BikeLease < ApplicationRecord
  # Association
  belongs_to :bike
  belongs_to :dealer
  belongs_to :admin_user, optional: true

  # Enum
  enum lease_status: { awaiting: 0, approved: 1 }
end
