module Cryptopia
  module Api
    module Public
      def currencies
        response = self.class.get('/GetCurrencies')

        response.code == 200 ? response.to_h : {}
      end

      def trade_pairs
        response = self.class.get('/GetTradePairs')

        response.code == 200 ? response.to_h : {}
      end
    end
  end
end
