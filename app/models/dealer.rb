class Dealer < ApplicationRecord
  # Association
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
