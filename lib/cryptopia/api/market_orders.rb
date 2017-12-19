module Cryptopia
  module Api
    class MarketOrders
      include HTTParty

      def initialize(uri)
        self.class.base_uri uri
      end

      def call(market, options = {})
        if market == nil || market == ''
          raise ArgumentError, 'The trade pair must be informed'
        end

        if invalid_params?(options)
          raise ArgumentError, 'Arguments must be :orderCount'
        end

        endpoint_call_handler(market, options)
      end

      private

      def endpoint_call_handler(market, options = {})
        if options.keys.length.zero?
          self.class.get("/GetMarketOrders/#{market}")
        else
          self.class.get("/GetMarketOrders/#{market}/#{options.values.join('/')}")
        end
      end

      def invalid_params?(options = {})
        return false if options.keys.length.zero?

        (options.keys - available_params).length >= 1
      end

      def available_params
        [:orderCount]
      end
    end
  end
end
