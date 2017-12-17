require 'spec_helper'

RSpec.describe Cryptopia::Api::Base do
  context 'public' do
    describe '#currencies' do
      it 'return the info about all the currencies' do
        result = subject.currencies

        expect(result["Data"][0]).to eq({
          "Id" => 331,
          "Name" => "1337",
          "Symbol" => "1337",
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

        expect(result["Data"][0]).to eq({
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

    describe '#markets' do
      it 'returns all the markets with default params' do
        result = subject.markets

        expect(result["Data"][0]).to eq({
          "TradePairId" => 1261,
          "Label" => "$$$/BTC",
          "AskPrice" => 1.3e-07,
          "BidPrice" => 1.0e-07,
          "Low" => 9.0e-08,
          "High" => 1.2e-07,
          "Volume" => 460664.60867905,
          "LastPrice" => 1.2e-07,
          "BuyVolume" => 18026045.65786899,
          "SellVolume" => 19152018.65949742,
          "Change" => 9.09,
          "Open" => 1.1e-07,
          "Close" => 1.2e-07,
          "BaseVolume" => 0.05012609,
          "BuyBaseVolume" => 0.33138836,
          "SellBaseVolume" => 28951333.17017219
        })
      end

      it 'return all markets with baseParam' do
        result = subject.markets(baseParam: 'BTC')

        expect(result["Data"][0]).to eq({
          "TradePairId" => 1261,
          "Label" => "$$$/BTC",
          "AskPrice" => 1.3e-07,
          "BidPrice" => 1.0e-07,
          "Low" => 9.0e-08,
          "High" => 1.2e-07,
          "Volume" => 460664.60867905,
          "LastPrice" => 1.2e-07,
          "BuyVolume" => 18026045.65786899,
          "SellVolume" => 19152018.65949742,
          "Change" => 9.09,
          "Open" => 1.1e-07,
          "Close" => 1.2e-07,
          "BaseVolume" => 0.05012609,
          "BuyBaseVolume" => 0.33138836,
          "SellBaseVolume" => 28951333.17017219
        })
      end

      it 'return all markets with hours' do
        result = subject.markets(hours: 12)

        expect(result["Data"][0]).to eq({
          "TradePairId" => 1261,
          "Label" => "$$$/BTC",
          "AskPrice" => 1.3e-07,
          "BidPrice" => 1.0e-07,
          "Low" => 1.0e-07,
          "High" => 1.2e-07,
          "Volume" => 252204.67866228,
          "LastPrice" => 1.2e-07,
          "BuyVolume" => 18026045.65786899,
          "SellVolume" => 19152018.65949742,
          "Change" => 20.0,
          "Open" => 1.0e-07,
          "Close" => 1.2e-07,
          "BaseVolume" => 0.02931281,
          "BuyBaseVolume" => 0.33138836,
          "SellBaseVolume" => 28951333.17017219
        })
      end
    end

    describe '#market' do
      it 'returns the specified market by trade pair with default params' do
        result = subject.market('DOT_BTC')

        expect(result["Data"][0]).to eq({
          "TradePairId" => 1261,
          "Label" => "$$$/BTC",
          "AskPrice" => 1.3e-07,
          "BidPrice" => 1.0e-07,
          "Low" => 9.0e-08,
          "High" => 1.2e-07,
          "Volume" => 460664.60867905,
          "LastPrice" => 1.2e-07,
          "BuyVolume" => 18026045.65786899,
          "SellVolume" => 19152018.65949742,
          "Change" => 9.09,
          "Open" => 1.1e-07,
          "Close" => 1.2e-07,
          "BaseVolume" => 0.05012609,
          "BuyBaseVolume" => 0.33138836,
          "SellBaseVolume" => 28951333.17017219
        })
      end

      it 'return all markets with hours' do
        result = subject.market('$$$_BTC', hours: 12)

        expect(result["Data"][0]).to eq({
          "TradePairId" => 1261,
          "Label" => "$$$/BTC",
          "AskPrice" => 1.3e-07,
          "BidPrice" => 1.0e-07,
          "Low" => 9.0e-08,
          "High" => 1.2e-07,
          "Volume" => 460664.60867905,
          "LastPrice" => 1.2e-07,
          "BuyVolume" => 18026045.65786899,
          "SellVolume" => 19152018.65949742,
          "Change" => 9.09,
          "Open" => 1.1e-07,
          "Close" => 1.2e-07,
          "BaseVolume" => 0.05012609,
          "BuyBaseVolume" => 0.33138836,
          "SellBaseVolume" => 28951333.17017219
        })
      end
    end
  end
end
