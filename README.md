# Apilint

TODO: Write a gem description

## Installation

Install it yourself as:

    $ gem install apilint

## Usage

Right now, the gem usage is very basic. You can execute it with:

    bundle exec bin/apilint check YOUR-REQUESTS-FILE-PATH [-c configfile]

## Configuring

Currently there are this linters with the following configurations:

* deep_path.rb

  - MaxDepth: Longest depth accepted without warning.
  - Prefix: Prefix that should be ignored when counting nesting.

* downcase_path.rb
* include_timestamps.rb
* minified_json.rb
* rate_limit_status.rb
* return_resource.rb
* valid_json.rb

All plugins support the option "Enabled", which defaults to true.

[example_config.yml](example_config.yml)

## Hacking

To run the test suite:

    bundle exec rake

## Contributing

1. Fork it ( https://github.com/[my-github-username]/apilint/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
