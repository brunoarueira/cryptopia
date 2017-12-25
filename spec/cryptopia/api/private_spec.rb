require 'spec_helper'

RSpec.describe Cryptopia::Api::Base do
  subject do
    described_class.new(ENV['API_KEY'], ENV['API_SECRET'])
  end

  context 'private' do
    describe '#balance' do
      it 'returns all balances or a specific currency balance' do
        result = subject.balance(Currency: 'BTC')

        expect(result).to eq({
          "Success" => true,
          "Error" => nil,
          "Data" => [{
            "CurrencyId" => 1,
            "Symbol" => "BTC",
            "Total" => 0.00069673,
            "Available" => 0.00069673,
            "Unconfirmed" => 0.00000000,
            "HeldForTrades" => 0.00000000,
            "PendingWithdraw" => 0.00000000,
            "Address" => nil,
            "Status" => "OK",
            "StatusMessage" => nil,
            "BaseAddress" => nil
          }]
        })
			end
    end

    describe '#deposit_address' do
      it 'creates or returns a deposit address for the specified currency' do
        result = subject.deposit_address(Currency: 'DOT')

        expect(result).to eq({
					"Success" => true,
					"Error" => nil,
					"Data" => {
						"Currency" => "DOT",
						"Address" => "0x2b9db4ed225d927109c2b053e70c87506f661ead",
						"BaseAddress" => nil
					}
        })
      end
    end

    describe '#open_orders' do
      it 'returns a list of open orders for all tradepairs or specified tradepair' do
        result = subject.open_orders(Market: 'DOT/BTC')

        expect(result).to eq({
          "Success" => true,
          "Error" => nil,
          "Data" => []
        })
      end
    end

    describe '#trade_history' do
      it 'returns a list of trade history for all tradepairs or specified tradepair' do
        result = subject.trade_history(Market: 'DOT/BTC')

        expect(result).to eq({
          "Success" => true,
          "Error" => nil,
          "Data" => []
        })
      end
    end
  end
end
