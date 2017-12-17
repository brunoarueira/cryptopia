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

    describe '#markets' do
      it 'returns all the markets with default params' do
        result = subject.markets

        expect(result["Data"][0]).to eq({
          "AskPrice" => 1.3e-07,
          "BaseVolume" => 0.04627828,
          "BidPrice" => 1.0e-07,
          "BuyBaseVolume" => 0.34091631,
          "BuyVolume" => 18145144.9592662,
          "Change" => 9.09,
          "Close" => 1.2e-07,
          "High" => 1.2e-07,
          "Label" => "$$$/BTC",
          "LastPrice" => 1.2e-07,
          "Low" => 9.0e-08,
          "Open" => 1.1e-07,
          "SellBaseVolume" => 28951333.1701686,
          "SellVolume" => 19151991.08015154,
          "TradePairId" => 1261,
          "Volume" => 425684.52872923
        })
      end

      it 'return all markets with baseParam' do
        result = subject.markets(baseParam: 'BTC')

        expect(result["Data"][0]).to eq({
          "AskPrice" => 1.3e-07,
          "BaseVolume" => 0.04627828,
          "BidPrice" => 1.0e-07,
          "BuyBaseVolume" => 0.34091631,
          "BuyVolume" => 18145144.9592662,
          "Change" => 9.09,
          "Close" => 1.2e-07,
          "High" => 1.2e-07,
          "Label" => "$$$/BTC",
          "LastPrice" => 1.2e-07,
          "Low" => 9.0e-08,
          "Open" => 1.1e-07,
          "SellBaseVolume" => 28951333.1701686,
          "SellVolume" => 19151991.08015154,
          "TradePairId" => 1261,
          "Volume" => 425684.52872923
        })
      end

      it 'return all markets with hours' do
        result = subject.markets(hours: 12)

        expect(result["Data"][0]).to eq({
          "AskPrice" => 1.3e-07,
          "BaseVolume" => 0.02931281,
          "BidPrice" => 1.0e-07,
          "BuyBaseVolume" => 0.34091631,
          "BuyVolume" => 18145144.9592662,
          "Change" => 20.0,
          "Close" => 1.2e-07,
          "High" => 1.2e-07,
          "Label" => "$$$/BTC",
          "LastPrice" => 1.2e-07,
          "Low" => 1.0e-07,
          "Open" => 1.0e-07,
          "SellBaseVolume" => 28951333.1701686,
          "SellVolume" => 19151991.08015154,
          "TradePairId" => 1261,
          "Volume" => 252204.67866228
        })
      end
    end

    describe '#market' do
      it 'returns the specified market by trade pair with default params' do
        result = subject.market('DOT_BTC')

        expect(result["Data"]).to eq({
          "AskPrice" => 9.4e-07,
          "BaseVolume" => 5.37979199,
          "BidPrice" => 9.3e-07,
          "BuyBaseVolume" => 15.31336114,
          "BuyVolume" => 40358630.4328733,
          "Change" => -4.12,
          "Close" => 9.3e-07,
          "High" => 9.9e-07,
          "Label" => "DOT/BTC",
          "LastPrice" => 9.3e-07,
          "Low" => 9.2e-07,
          "Open" => 9.7e-07,
          "SellBaseVolume" => 511304236.06269586,
          "SellVolume" => 73114894.29888122,
          "TradePairId" => 100,
          "Volume" => 5739210.40431432
        })
      end

      it 'return all markets with hours' do
        result = subject.market('$$$_BTC', hours: 12)

        expect(result["Data"]).to eq({
          "AskPrice" => 1.3e-07,
          "BaseVolume" => 0.02931281,
          "BidPrice" => 1.0e-07,
          "BuyBaseVolume" => 0.34091631,
          "BuyVolume" => 18145144.9592662,
          "Change" => 20.0,
          "Close" => 1.2e-07,
          "High" => 1.2e-07,
          "Label" => "$$$/BTC",
          "LastPrice" => 1.2e-07,
          "Low" => 1.0e-07,
          "Open" => 1.0e-07,
          "SellBaseVolume" => 28951333.1701686,
          "SellVolume" => 19151991.08015154,
          "TradePairId" => 1261,
          "Volume" => 252204.67866228
        })
      end
    end
  end
end
