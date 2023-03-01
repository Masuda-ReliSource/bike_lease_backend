# frozen_string_literal: true

# admin serializer
class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :email, :status
  attribute :token do |user|
    user.auth_token
  end
end
