module Cryptopia
  module Api
    class Market
      include HTTParty

      def initialize(uri)
        self.class.base_uri uri
      end

      def call(market, options = {})
        if market == nil || market == ''
          raise ArgumentError, 'The trade pair must be informed'
        end

        if invalid_params?(options)
          raise ArgumentError, 'Arguments must be :hours'
        end

        endpoint_call_handler(market, options)
      end

      private

      def endpoint_call_handler(market, options = {})
        if options.keys.length.zero?
          self.class.get("/GetMarket/#{market}")
        else
          self.class.get("/GetMarket/#{market}/#{options.values.join('/')}")
        end
      end

      def invalid_params?(options = {})
        return false if options.keys.length.zero?

        (options.keys - available_params).length >= 1
      end

      def available_params
        [:hours]
      end
    end
  end
end
