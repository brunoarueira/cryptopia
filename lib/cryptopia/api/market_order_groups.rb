module Cryptopia
  module Api
    class MarketOrderGroups
      include HTTParty

      def initialize(uri)
        self.class.base_uri uri
      end

      def call(markets = [], options = {})
        if markets.nil? || (!markets.nil? && markets.empty?)
          raise ArgumentError, 'The trade pairs must be informed'
        end

        if invalid_params?(options)
          raise ArgumentError, 'Arguments must be :orderCount'
        end

        endpoint_call_handler(markets, options)
      end

      private

      def endpoint_call_handler(markets, options = {})
        handled_markets = markets.join('-')

        if options.keys.length.zero?
          self.class.get("/GetMarketOrderGroups/#{handled_markets}")
        else
          self.class.get("/GetMarketOrderGroups/#{handled_markets}/#{options.values.join('/')}")
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
