require 'httparty'
require 'cryptopia/api/market'
require 'cryptopia/api/public'
require 'cryptopia/api/private'

module Cryptopia
  module Api
    class Base
      include ::HTTParty
      include Public
      include Private

      base_uri 'https://www.cryptopia.co.nz/api'
      format :json

      private

      def for_uri(uri, &block)
        current_uri = self.class.base_uri

        self.class.base_uri uri

        result = block.call
      ensure
        self.class.base_uri current_uri

        result
      end

      def handle_response(response)
        response.code == 200 ? response.to_h : {}
      end
    end
  end
end
