require "botbot/version"
require 'net/http'
require 'json'
require 'date'

module Botbot
  require_relative 'botbot/brain'
  require_relative 'botbot/senses'
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
    brain = Brain.new
    yield brain

    keyword = Brain.new
    keyword.hear(Botbot.name) do
      keyword.say("How can I help?")
      brain.think
    end

    loop do
      keyword.think
      sleep 2
    end
  end
end

