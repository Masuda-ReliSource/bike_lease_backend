class Dealer < ApplicationRecord
  has_secure_password validations: false
  has_secure_token :auth_token, length: 36

  # Association
  has_many :bikes
  has_many :bike_leases
  belongs_to :admin_user

  # enum
  enum status: { active: 0, inactive: 1 },
       _prefix: true

  # validation
  validates :phone,
            uniqueness: true,
            presence: true
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }
  # TODO: custom validation for super_admin mail and dealer mail can't be same
end
