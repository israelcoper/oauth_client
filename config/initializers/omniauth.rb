require 'factor75'

Rails.application.config.middleware.use OmniAuth::Builder do
  # gethealthie development
  provider :factor75, "client_id", "client_secret"
end
