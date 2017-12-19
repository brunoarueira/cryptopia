require 'spec_helper'

RSpec.describe Cryptopia::Api::Base do
  describe '#markets' do
    it 'returns all the markets with default params' do
      result = subject.markets

      expect(result["Data"][0]).to eq({
        "AskPrice" => 1.3e-07,
        "BaseVolume" => 0.12789705,
        "BidPrice" => 1.2e-07,
        "BuyBaseVolume" => 0.41448521,
        "BuyVolume" => 18911723.63061377,
        "Change" => -7.14,
        "Close" => 1.3e-07,
        "High" => 1.9e-07,
        "Label" => "$$$/BTC",
        "LastPrice" => 1.3e-07,
        "Low" => 1.2e-07,
        "Open" => 1.4e-07,
        "SellBaseVolume" => 28944872.77861143,
        "SellVolume" => 18268187.63048001,
        "TradePairId" => 1261,
        "Volume" => 838902.11273494
      })
    end

    it 'return all markets with baseParam' do
      result = subject.markets(baseParam: 'BTC')

      expect(result["Data"][0]).to eq({
        "AskPrice" => 1.3e-07,
        "BaseVolume" => 0.12789705,
        "BidPrice" => 1.2e-07,
        "BuyBaseVolume" => 0.42921344,
        "BuyVolume" => 19122126.96679854,
        "Change" => -7.14,
        "Close" => 1.3e-07,
        "High" => 1.9e-07,
        "Label" => "$$$/BTC",
        "LastPrice" => 1.3e-07,
        "Low" => 1.2e-07,
        "Open" => 1.4e-07,
        "SellBaseVolume" => 28944872.77861143,
        "SellVolume" => 18268187.63048001,
        "TradePairId" => 1261,
        "Volume" => 838902.11273494
      })
    end

    it 'return all markets with hours' do
      result = subject.markets(hours: 12)

      expect(result["Data"][0]).to eq({
        "AskPrice" => 1.3e-07,
        "BaseVolume" => 0.11297315,
        "BidPrice" => 1.2e-07,
        "BuyBaseVolume" => 0.42804395,
        "BuyVolume" => 19112381.23884413,
        "Change" => -7.14,
        "Close" => 1.3e-07,
        "High" => 1.9e-07,
        "Label" => "$$$/BTC",
        "LastPrice" => 1.3e-07,
        "Low" => 1.3e-07,
        "Open" => 1.4e-07,
        "SellBaseVolume" => 28944872.77861143,
        "SellVolume" => 18268187.63048001,
        "TradePairId" => 1261,
        "Volume" => 722737.64407227
      })
    end
  end

  describe '#market' do
    it 'returns the specified market by trade pair with default params' do
      result = subject.market('DOT_BTC')

      expect(result["Data"]).to eq({
        "AskPrice" => 9.4e-07,
        "BaseVolume" => 4.57130784,
        "BidPrice" => 9.3e-07,
        "BuyBaseVolume" => 24.25612502,
        "BuyVolume" => 50420015.38237966,
        "Change" => -2.11,
        "Close" => 9.3e-07,
        "High" => 9.6e-07,
        "Label" => "DOT/BTC",
        "LastPrice" => 9.3e-07,
        "Low" => 9.2e-07,
        "Open" => 9.5e-07,
        "SellBaseVolume" => 511304246.63619405,
        "SellVolume" => 76084268.73132023,
        "TradePairId" => 100,
        "Volume" => 4889846.46265576
      })
    end

    it 'return all markets with hours' do
      result = subject.market('$$$_BTC', hours: 12)

      expect(result["Data"]).to eq({
        "AskPrice" => 1.3e-07,
        "BaseVolume" => 0.11297315,
        "BidPrice" => 1.2e-07,
        "BuyBaseVolume" => 0.42804395,
        "BuyVolume" => 19112381.23884413,
        "Change" => -7.14,
        "Close" => 1.3e-07,
        "High" => 1.9e-07,
        "Label" => "$$$/BTC",
        "LastPrice" => 1.3e-07,
        "Low" => 1.3e-07,
        "Open" => 1.4e-07,
        "SellBaseVolume" => 28944872.77743327,
        "SellVolume" => 18259772.24586001,
        "TradePairId" => 1261,
        "Volume" => 722737.64407227
      })
    end
  end

  describe '#market_history' do
    it 'returns the specified market by trade pair with default params' do
      result = subject.market_history('DOT_BTC')

      expect(result["Data"][0]).to eq({
        "Amount" => 2946.04017633,
        "Label" => "DOT/BTC",
        "Price" => 9.3e-07,
        "Timestamp" => 1513709309,
        "Total" => 0.00273982,
        "TradePairId" => 100,
        "Type" => "Sell"
      })
    end

    it 'return all markets with hours' do
      result = subject.market_history('$$$_BTC', hours: 12)

      expect(result["Data"][0]).to eq({
        "Amount" => 3900.0,
        "Label" => "$$$/BTC",
        "Price" => 1.3e-07,
        "Timestamp" => 1513706097,
        "Total" => 0.000507,
        "TradePairId" => 1261,
        "Type" => "Buy"
      })
    end
  end

  describe '#market_orders' do
    it 'returns the specified market by trade pair with default params' do
      result = subject.market_orders('DOT_BTC')

      expect(result["Data"]["Buy"].size).to be <= 100
      expect(result["Data"]["Sell"].size).to be <= 100

      expect(result["Data"]["Buy"][0]).to eq({
        "Label" => "DOT/BTC",
        "Price" => 9.3e-07,
        "Total" => 0.52856364,
        "TradePairId" => 100,
        "Volume" => 568348.00308697
      })

      expect(result["Data"]["Sell"][0]).to eq({
        "Label" => "DOT/BTC",
        "Price" => 9.4e-07,
        "Total" => 0.27165719,
        "TradePairId" => 100,
        "Volume" => 288997.00833176
      })
    end

    it 'return all markets with orderCount' do
      result = subject.market_orders('$$$_BTC', orderCount: 50)

      expect(result["Data"]["Buy"].size).to be <= 50
      expect(result["Data"]["Sell"].size).to be <= 50

      expect(result["Data"]["Buy"][0]).to eq({
        "Label" => "$$$/BTC",
        "Price" => 1.2e-07,
        "Total" => 0.00930302,
        "TradePairId" => 1261,
        "Volume" => 77525.1642584
      })

      expect(result["Data"]["Sell"][0]).to eq({
        "Label" => "$$$/BTC",
        "Price" => 1.3e-07,
        "Total" => 0.00013914,
        "TradePairId" => 1261,
        "Volume" => 1070.31835742
      })
    end
  end

  describe '#market_order_groups' do
    it 'returns the specified market by trade pair with default params' do
      result = subject.market_order_groups(['DOT_BTC', 101])

      expect(result["Data"][0]["Buy"].size).to be <= 100
      expect(result["Data"][1]["Buy"].size).to be <= 100

      expect(result["Data"][0]["Market"]).to eq "DOT_BTC"
      expect(result["Data"][0]["TradePairId"]).to eq 100

      expect(result["Data"][1]["Market"]).to eq "LTC_BTC"
      expect(result["Data"][1]["TradePairId"]).to eq 101
    end

    it 'return all markets with orderCount' do
      result = subject.market_order_groups(['$$$_BTC', 'DOGE_BTC'], orderCount: 2)

      expect(result["Data"][0]["Buy"].size).to be <= 50
      expect(result["Data"][1]["Buy"].size).to be <= 50

      expect(result["Data"][0]).to eq({
        "Buy" => [{
          "TradePairId" => 1261,
          "Label" => "$$$_BTC",
          "Price" => 1.2e-07,
          "Volume" => 77525.1642584,
          "Total" => 0.00930302
        },
        {
          "TradePairId" => 1261,
          "Label" => "$$$_BTC",
          "Price" => 1.1e-07,
          "Volume" => 261163.21901651,
          "Total" => 0.02872795
        }],
        "Sell" => [{
          "TradePairId" => 1261,
          "Label" => "$$$_BTC",
          "Price" => 1.3e-07,
          "Volume" => 1070.31835742,
          "Total" => 0.00013914
        },
        {
          "TradePairId" => 1261,
          "Label" => "$$$_BTC",
          "Price" => 1.9e-07,
          "Volume" => 204930.00503164,
          "Total" => 0.0389367
        }],
        "TradePairId" => 1261,
        "Market" => "$$$_BTC"
      })

      expect(result["Data"][1]).to eq({
        "Market" => "DOGE_BTC",
        "TradePairId" => 102,
        "Buy" => [{
          "TradePairId" => 102,
          "Label" => "DOGE_BTC",
          "Price" => 3.2e-07,
          "Volume" => 13271320.57055452,
          "Total" => 4.24682258
        },
        {
          "TradePairId" => 102,
          "Label" => "DOGE_BTC",
          "Price" => 3.1e-07,
          "Volume" => 8567802.70278602,
          "Total" => 2.65601884
        }],
        "Sell" => [{
          "TradePairId" => 102,
          "Label" => "DOGE_BTC",
          "Price" => 3.3e-07,
          "Volume" => 6245168.23930626,
          "Total" => 2.06090552
        },
        {
          "TradePairId" => 102,
          "Label" => "DOGE_BTC",
          "Price" => 3.4e-07,
          "Volume" => 2187634.09886401,
          "Total" => 0.74379559
        }]
      })
    end
  end
end
