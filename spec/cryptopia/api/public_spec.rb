require 'spec_helper'

RSpec.describe Cryptopia::Api::Base do
  context 'public' do
    describe '#currencies' do
      it 'return the info about all the currencies' do
        result = subject.currencies

        expect(result["Data"][0]).to eq({
          "Algorithm" => "POS",
          "DepositConfirmations" => 20,
          "Id" => 331,
          "IsTipEnabled" => false,
          "ListingStatus" => "Active",
          "MaxWithdraw" => 2000000000.0,
          "MinBaseTrade" => 2.0e-05,
          "MinTip" => 166.66666666,
          "MinWithdraw" => 20000.0,
          "Name" => "1337",
          "Status" => "OK",
          "StatusMessage" => nil,
          "Symbol" => "1337",
          "WithdrawFee" => 0.01
        })
      end
    end

    describe '#trade_pairs' do
      it 'returns all the trade pairs' do
        result = subject.trade_pairs

        expect(result["Data"][0]).to eq({
          "BaseCurrency" => "Tether",
          "BaseSymbol" => "USDT",
          "Currency" => "Bitcoin",
          "Id" => 4909,
          "Label" => "BTC/USDT",
          "MaximumBaseTrade" => 100000000.0,
          "MaximumPrice" => 100000000.0,
          "MaximumTrade" => 100000000.0,
          "MinimumBaseTrade" => 1.0,
          "MinimumPrice" => 1.0e-08,
          "MinimumTrade" => 1.0e-08,
          "Status" => "OK",
          "StatusMessage" => nil,
          "Symbol" => "BTC",
          "TradeFee" => 0.2
        })
      end
    end
  end
end
