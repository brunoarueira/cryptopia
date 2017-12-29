# Cryptopia

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

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/brunoarueira/cryptopia. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Cryptopia project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/brunoarueira/cryptopia/blob/master/CODE_OF_CONDUCT.md).
