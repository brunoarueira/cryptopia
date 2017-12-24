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
  end
end
