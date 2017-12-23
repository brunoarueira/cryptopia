module Cryptopia
  module Api
    class Market
      include HTTParty

      AVAILABLE_PARAMS = {
        markets: [:baseParam, :hours],
        market: [:hours],
        history: [:hours],
        orders: [:orderCount],
        order_groups: [:orderCount]
      }

      def initialize(uri)
        self.class.base_uri uri
      end

      def all(options = {})
        if invalid_params?(:markets, options)
          raise ArgumentError, "Arguments must be #{params(:markets)}"
        end

        endpoint_call_handler("/GetMarkets", options)
      end

      def find(market, options = {})
        if valid_market?(market)
          raise ArgumentError, 'The trade pair must be informed'
        end

        if invalid_params?(:market, options)
          raise ArgumentError, "Arguments must be #{params(:market)}"
        end

        endpoint_call_handler("/GetMarket/#{market}", options)
      end

      def history(market, options = {})
        if valid_market?(market)
          raise ArgumentError, 'The trade pair must be informed'
        end

        if invalid_params?(:history, options)
          raise ArgumentError, "Arguments must be #{params(:history)}"
        end

        endpoint_call_handler("/GetMarketHistory/#{market}", options)
      end

      def orders(market, options = {})
        if valid_market?(market)
          raise ArgumentError, 'The trade pair must be informed'
        end

        if invalid_params?(:orders, options)
          raise ArgumentError, "Arguments must be #{params(:orders)}"
        end

        endpoint_call_handler("/GetMarketOrders/#{market}", options)
      end

      def order_groups(markets = [], options = {})
        if markets.nil? || (!markets.nil? && markets.empty?)
          raise ArgumentError, 'The trade pairs must be informed'
        end

        if invalid_params?(:order_groups, options)
          raise ArgumentError, "Arguments must be #{params(:order_groups)}"
        end

        handled_markets = markets.join('-')

        endpoint_call_handler("/GetMarketOrderGroups/#{handled_markets}", options)
      end

      private

      def endpoint_call_handler(url, options = {})
        if options.keys.length.zero?
          self.class.get(url)
        else
          self.class.get("#{url}/#{options.values.join('/')}")
        end
      end

      def invalid_params?(endpoint, options = {})
        return false if options.keys.length.zero?

        (options.keys - AVAILABLE_PARAMS[endpoint]).length >= 1
      end

      def valid_market?(market)
        market.nil? || (market != nil && market == '')
      end

      def params(endpoint)
        AVAILABLE_PARAMS[endpoint].join(' or ')
      end
    end
  end
end
