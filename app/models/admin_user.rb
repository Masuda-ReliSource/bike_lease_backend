# frozen_string_literal: true

class AdminUser < ApplicationRecord
  has_secure_password validations: false
  # Association
  has_many :created_admins,
           foreign_key: 'created_by',
           class_name: 'AdminUser'
  belongs_to :main_admin,
             foreign_key: 'created_by',
             class_name: 'AdminUser',
             optional: true
  # enum
  enum status: { active: 0, inactive: 1 },
       _prefix: :admin
  enum role_type: { super_admin: 0, admin: 1 }

  validates :phone,
            uniqueness: true,
            presence: true
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }
end
