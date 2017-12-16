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
  end
end
