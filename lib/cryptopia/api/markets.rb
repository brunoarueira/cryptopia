module Cryptopia
  module Api
    class Markets
      include HTTParty

      def initialize(uri)
        self.class.base_uri uri
      end

      def call(options = {})
        if invalid_params?(options)
          raise ArgumentError, 'Arguments must be :baseParam or :hours'
        end

        endpoint_call_handler(options)
      end

      private

      def endpoint_call_handler(options = {})
        if options.keys.length.zero?
          self.class.get('/GetMarkets')
        else
          self.class.get("/GetMarkets/#{options.values.join('/')}")
        end
      end

      def invalid_params?(options = {})
        return false if options.keys.length.zero?

        (options.keys - available_params).length >= 1
      end

      def available_params
        [:baseParam, :hours]
      end
    end
  end
end
