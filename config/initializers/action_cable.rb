# frozen_string_literal: true
if Rails.env.development?
  Rails.application.config.action_cable.allowed_request_origins = %w(http://localhost:3000 http://127.0.0.1:3000)
end
