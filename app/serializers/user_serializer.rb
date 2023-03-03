# frozen_string_literal: true

# admin/dealer serializer
class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :email, :status
  attribute :token do |user|
    user.auth_token
  end
  attribute :user_type do |user|
    user.class.name.to_s.underscore
  end
end
