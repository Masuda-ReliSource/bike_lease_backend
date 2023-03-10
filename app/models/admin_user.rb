# frozen_string_literal: true

class AdminUser < ApplicationRecord
  has_secure_password validations: false
  has_secure_token :auth_token, length: 30

  # Association
  has_many :created_admins,
           foreign_key: 'created_by',
           class_name: 'AdminUser'
  has_many :dealers
  has_many :bike_leases
  belongs_to :main_admin,
             foreign_key: 'created_by',
             class_name: 'AdminUser',
             optional: true
  # enum
  enum status: { active: 0, inactive: 1 },
       _prefix: :admin
  enum role_type: { super_admin: 0, admin: 1 }

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
