# Cryptopia

# ANNOUNCEMENT

See https://github.com/brunoarueira/cryptopia/issues/1#issuecomment-496508157

This is a crytopia's api wrapper gem. This gem implements all the public api
(see https://www.cryptopia.co.nz/Forum/Thread/255) and part of the private api
(see #5).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cryptopia'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cryptopia

## Usage

Must of the api endpoints follow a camel case name and for the endpoints which
have prefixed with ```Get```, was removed e.g GetMarkets => markets

## Examples

### Public API

    #!/usr/bin/env ruby

    require 'pp'
    require 'bundler/setup'
    require 'cryptopia'

    api = Cryptopia::Api::Base.new

    # List currency markets
    result = api.currencies
    result['Data'].each {|currency| pp currency}

    # ...
    # {"Id"=>501,
    #  "Name"=>"Byteball Bytes",
    #  "Symbol"=>"GBYTE",
    #  "Algorithm"=>"Scrypt",
    #  "WithdrawFee"=>2.0e-05,
    #  "MinWithdraw"=>4.0e-05,
    #  "MaxWithdraw"=>20000000.0,
    #  "MinBaseTrade"=>2.0e-05,
    #  "IsTipEnabled"=>false,
    #  "MinTip"=>0.0,
    #  "DepositConfirmations"=>1,
    #  "Status"=>"OK",
    #  "StatusMessage"=>nil,
    #  "ListingStatus"=>"Active"},
    # ...

    # Find a specific market
    pp api.market('ETH_BTC')

    # => {"Success"=>true,
    #     "Message"=>nil,
    #     "Data"=>
    #      {"TradePairId"=>5203,
    #       "Label"=>"ETH/BTC",
    #       "AskPrice"=>0.05662816,
    #       "BidPrice"=>0.05657025,
    #       "Low"=>0.05487982,
    #       "High"=>0.05877784,
    #       "Volume"=>868.02571841,
    #       "LastPrice"=>0.05662816,
    #       "BuyVolume"=>5465012.72839449,
    #       "SellVolume"=>672.33031819,
    #       "Change"=>-0.95,
    #       "Open"=>0.05717244,
    #       "Close"=>0.05662816,
    #       "BaseVolume"=>49.31616924,
    #       "BuyBaseVolume"=>10.12366787,
    #       "SellBaseVolume"=>19039274.25315152},
    #

### Private API

    #!/usr/bin/env ruby

    require 'pp'
    require 'bundler/setup'
    require 'cryptopia'

    api = Cryptopia::Api::Base.new(
      ENV.fetch('CRYPTOPIA_API_KEY'),
      ENV.fetch('CRYPTOPIA_API_SECRET')
    )

    # List your balance for all currencies
    pp api.balance

    # => {"Success"=>true,
    #     "Error"=>nil,
    #     "Data"=>
    #      [{"CurrencyId"=>762,
    #        "Symbol"=>"$PAC",
    #        "Total"=>0.0,
    #        "Available"=>0.0,
    #        "Unconfirmed"=>0.0,
    #        ...

    # List your balance for a single currency
    pp api.balance('Currency' => 'ETH')

    # => {"Success"=>true,
    #     "Error"=>nil,
    #     "Data"=>
    #      [{"CurrencyId"=>530,
    #        "Symbol"=>"ETH",
    #        "Total"=>0.0,
    #        "Available"=>0.0,
    #        "Unconfirmed"=>0.0,
    #        "HeldForTrades"=>0.0,
    #        "PendingWithdraw"=>0.0,
    #        "Address"=>nil,
    #        "Status"=>"OK",
    #        "StatusMessage"=>nil,
    #        "BaseAddress"=>nil}]}

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/brunoarueira/cryptopia. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Cryptopia project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/brunoarueira/cryptopia/blob/master/CODE_OF_CONDUCT.md).
