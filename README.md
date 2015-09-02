# ruboty-rsay

A Ruboty plugin for [rsay](https://github.com/ryotarai/rsay)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruboty-rsay'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruboty-rsay

## Usage

Before using ruboty-rsay, please set up and run rsay.

```
$ RSAY_QUEUE_URLS='living:https://sqs.region.amazonaws.com/123456789/rsay-living,bedroom' ruboty
```

```
> ruboty rsay "Hello world" to living
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ruboty-rsay.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
