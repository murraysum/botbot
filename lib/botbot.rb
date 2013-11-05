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

  def self.log(message)
    puts "#{DateTime.now.strftime("%Y-%m-%d %H:%S")} #{message}" if @config.debug?
  end

  def self.run
    parser = Parser.new
    yield parser

    keyword = Parser.new
    keyword.hear(Botbot.name) do
      `say #{"How can I help?"}`
      parser.run
    end

    loop do
      keyword.run
      sleep 2
    end
  end
end
