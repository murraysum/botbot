# Botbot

A little voice activated robot.

## Installation

Add this line to your application's Gemfile:

    gem 'botbot'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install botbot

## Usage

```
#!/usr/bin/env ruby
require 'botbot'

Botbot.configure do |config|
  config.name = "Butler"
end

Botbot.run do |bot|
  bot.hear(/who are you/i) do
    bot.say("Hello World, I am #{Botbot.name}")
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
