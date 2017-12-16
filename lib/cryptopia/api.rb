require 'httparty'
require 'cryptopia/api/public'

module Cryptopia
  module Api
    class Base
      include ::HTTParty
      include Public

      base_uri 'https://www.cryptopia.co.nz/api'
      format :json

      def initialize()
      end
    end
  end
end
