Rails.application.routes.draw do
  # client_credentials flow
  # get '/factor75_auth' => 'application#factor75_auth'

  # authorization_code flow
  get '/auth/:provider/callback' => 'application#authentication_callback'

  root to: redirect('/auth/factor75')
end
