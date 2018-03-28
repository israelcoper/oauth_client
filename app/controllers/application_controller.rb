class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from OmniAuth::Strategies::OAuth2::CallbackError do |e|
    render plain: e
  end

  rescue_from RestClient::Unauthorized do |e|
    render plain: e
  end

  # authorization_code flow
  def authentication_callback
    auth = request.env['omniauth.auth']
    render json: auth.to_json
  end
 
  # client_credentials flow
  # def factor75_auth
  #   client_id = ""
  #   client_secret = ""
  #   host = ""

  #   res = RestClient.post "http://#{host}/oauth/token", {
  #     grant_type: "client_credentials",
  #     client_id: client_id,
  #     client_secret: client_secret
  #   }
  #   token = JSON.parse(res)["access_token"]
  #   auth = RestClient.get "http://#{host}/api/oauth/user.json", {
  #     "Authorization" => "Bearer #{token}",
  #     params: { email: params[:email] }
  #   }
  #   render json: auth
  # end
end
