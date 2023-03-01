# frozen_string_literal: true

class ApplicationController < ActionController::API
  def failed_response(message)
    {
      data: nil,
      message: message,
    }
  end
end
