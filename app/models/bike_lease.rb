class BikeLease < ApplicationRecord
  # Association
  belongs_to :bike
  belongs_to :dealer
  belongs_to :admin_user, optional: true
end
