require 'cgi'
require 'json'
require 'base64'
require 'openssl'

module Cryptopia
  module Api
    module Private
      ENDPOINT = 'https://www.cryptopia.co.nz/Api'

      AVAILABLE_PARAMS = {
        balance: [:Currency, :CurrencyId],
        deposit_address: [:Currency, :CurrencyId],
        open_orders: [:Market, :TradePairId],
        trade_history: [:Market, :TradePairId],
        transactions: [:Type],
        submit_trade: [:Market, :TradePairId]
      }

      OPTIONAL_PARAMS = {
        open_orders: [:Count]
      }

      EXACT_PARAMS = {
        submit_trade: [:Type, :Rate, :Amount]
      }

      def initialize(api_key = nil, api_secret = nil)
        @api_key = api_key
        @api_secret = api_secret
      end

      def balance(options = {})
        for_uri(Private::ENDPOINT) do
          if invalid_params?(:balance, options)
            raise ArgumentError, "Arguments must be #{params(:balance)}"
          end

          handle_response(auth_post('/GetBalance', options))
        end
      end

      def deposit_address(options = {})
        for_uri(Private::ENDPOINT) do
          if invalid_params?(:deposit_address, options)
            raise ArgumentError, "Arguments must be #{params(:deposit_address)}"
          end

          handle_response(auth_post('/GetDepositAddress', options))
        end
			end

			def open_orders(options = {})
        for_uri(Private::ENDPOINT) do
          if invalid_params?(:deposit_address, options)
            raise ArgumentError, "Arguments must be #{params(:deposit_address)}"
          end

          handle_response(auth_post('/GetOpenOrders', options))
        end
			end

      def trade_history(options = {})
        for_uri(Private::ENDPOINT) do
          if invalid_params?(:trade_history, options)
            raise ArgumentError, "Arguments must be #{params(:trade_history)}"
          end

          handle_response(auth_post('/GetTradeHistory', options))
        end
      end

      def transactions(options = {})
        for_uri(Private::ENDPOINT) do
          if invalid_params?(:transactions, options)
            raise ArgumentError, "Arguments must be #{params(:transactions)}"
          end

          if invalid_transaction_type?(options)
            raise ArgumentError, "Type must be 'Deposit' or 'Withdraw'"
          end

          handle_response(auth_post('/GetTransactions', options))
        end
      end

      def submit_trade(options = {})
        for_uri(Private::ENDPOINT) do
          if invalid_params?(:submit_trade, options, true)
            raise ArgumentError, "Arguments must be #{params(:submit_trade)}"
          end

          handle_response(auth_post('/SubmitTrade', options))
        end
      end

      private

      attr_reader :api_key, :api_secret, :url, :options

      def auth_post(endpoint, options = {})
        if keys_is_not_present?
          raise ArgumentError, "The api key and/or api secret must be informed"
        end

        @url = self.class.base_uri + endpoint
        @options = options.to_json

        self.class.post(
          endpoint,
          body: @options,
          headers: {
            'Authorization' => "amx #{authorization_formatted_value}",
            'Content-Type' => 'application/json'
          })
      end

      def keys_is_not_present?
        (api_key.nil? || (!api_key.nil? && api_key == '')) ||
         (api_secret.nil? || (!api_secret.nil? && api_secret == ''))
      end

      def authorization_formatted_value
        [
          api_key,
          hmacsignature,
          nonce
        ].join(':')
      end

      def hmacsignature
        hmac = OpenSSL::HMAC.digest(
          OpenSSL::Digest.new('sha256'),
          Base64.decode64(api_secret),
          signature
        )

        Base64.encode64(hmac).strip
      end

      def signature
        [
          api_key,
          'POST',
          CGI::escape(url).downcase,
          nonce,
          hashed_post_params
        ].join.strip
      end

      def hashed_post_params
        md5 = Digest::MD5.new.digest(options.to_s)

        Base64.encode64(md5)
      end

      def nonce
        @nonce ||= Time.now.to_i.to_s
      end

      def invalid_transaction_type?(options)
        return false if options.keys.length.zero?

        options.key?(:Type) && (options[:Type] != 'Deposit' && options[:Type] != 'Withdraw')
      end

      def invalid_params?(endpoint, options = {}, exact = false)
        return false if options.keys.length.zero?

        available_keys = options.keys - AVAILABLE_PARAMS[endpoint]
        available_keys.length == 1 &&
          (
            OPTIONAL_PARAMS.key?(endpoint) &&
            (OPTIONAL_PARAMS[endpoint] - available_keys) >= 1
          ) &&
          (
            exact &&
            EXACT_PARAMS.key?(endpoint) &&
            EXACT_PARAMS[endpoint]
          )
      end

      def params(endpoint)
        AVAILABLE_PARAMS[endpoint].join(' or ')
      end
    end
  end
end
