module Cryptopia
  module Api
    module Public
      def currencies
        handle_response(self.class.get('/GetCurrencies'))
      end

      def trade_pairs
        handle_response(self.class.get('/GetTradePairs'))
      end

      def markets(options = {})
        handle_response(Markets.new(self.class.base_uri).call(options))
      end

      def market(market, options = {})
        handle_response(Market.new(self.class.base_uri).call(market, options))
      end

      def market_history(market, options = {})
        handle_response(MarketHistory.new(self.class.base_uri).call(market, options))
      end

      def market_orders(market, options = {})
        handle_response(MarketOrders.new(self.class.base_uri).call(market, options))
      end

      private

      def handle_response(response)
        response.code == 200 ? response.to_h : {}
      end
    end
  end
end
