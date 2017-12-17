require 'spec_helper'

RSpec.describe Cryptopia::Api::Base do
  context 'public' do
    describe '#currencies' do
      it 'return the info about all the currencies' do
        result = subject.currencies

        expect(result["Data"][0]).to include({
          "Id" => 331,
          "Name" => "1337",
          "Algorithm" => "POS",
          "WithdrawFee" => 0.01,
          "MinWithdraw" => 20000.0,
          "MaxWithdraw" => 2000000000.0,
          "MinBaseTrade" => 2.0e-05,
          "IsTipEnabled" => false,
          "MinTip" => 166.66666666,
          "DepositConfirmations" => 20,
          "Status" => "OK",
          "StatusMessage" => nil,
          "ListingStatus" => "Active"
        })
      end
    end

    describe '#trade_pairs' do
      it 'returns all the trade pairs' do
        result = subject.trade_pairs

        expect(result["Data"][0]).to include({
          "Id" => 4909,
          "Label" => "BTC/USDT",
          "Currency" => "Bitcoin",
          "Symbol" => "BTC",
          "BaseCurrency" => "Tether",
          "BaseSymbol" => "USDT",
          "Status" => "OK",
          "StatusMessage" => nil,
          "TradeFee" => 0.2,
          "MinimumTrade" => 1.0e-08,
          "MaximumTrade" => 100000000.0,
          "MinimumBaseTrade" => 1.0,
          "MaximumBaseTrade" => 100000000.0,
          "MinimumPrice" => 1.0e-08,
          "MaximumPrice" => 100000000.0
        })
      end
    end
  end
end
