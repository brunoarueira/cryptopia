require 'httparty'
require 'cryptopia/api/market'
require 'cryptopia/api/public'

module Cryptopia
  module Api
    class Base
      include ::HTTParty
      include Public

      base_uri 'https://www.cryptopia.co.nz/api'
      format :json

      private

      def handle_response(response)
        response.code == 200 ? response.to_h : {}
      end
    end
  end
end
