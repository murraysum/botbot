module Botbot
  class Brain
    def initialize
      @commands = []
    end

    def hear(matcher, &block)
      command = Command.new(matcher, block)
      @commands << command
      command
    end

    def say(message)
      Senses.say(message)
    end

    def think
      utterance = Senses.listen
      if !utterance.nil?
        match = @commands.detect { |command| command.match?(utterance) }
        if !match.nil?
          match.handler.call
        else
          Botbot.log("No match for utterance: #{utterance}")
        end
      end
    end
  end
end