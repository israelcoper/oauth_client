require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Factor75 < OmniAuth::Strategies::OAuth2
      option :name, 'factor75'
      option :client_options, {
        site: '',
        authorize_url: '/oauth/authorize'
      }

      uid {
        raw_info['id']
      }

      info do
        {
          email: raw_info['email'],
          name: raw_info['name']
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/oauth/user').parsed
      end
    end
  end
end
