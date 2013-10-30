require "botbot/version"
require 'net/http'
require 'json'
require 'date'

module Botbot
  require_relative 'botbot/parser'
  require_relative 'botbot/command'
  require_relative 'botbot/client'
  require_relative 'botbot/keyword'
  require_relative 'botbot/configuration'

  def self.name
    @config.name
  end

  def self.configure
    @config = Configuration.new
    yield @config
  end

  def self.run
    parser = Parser.new
    yield parser

    loop do
      Keyword.hear do
        parser.run
      end
      sleep 2
    end
  end
end

# Botbot.configure do |config|
#   config.name = "Jarvis"
# end

# Botbot.run do |bot|
#   bot.hear(/who are you/) do
#     `say #{"Hello"}`
#   end
# end
