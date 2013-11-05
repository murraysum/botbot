module Botbot
  class Parser
    def initialize
      @commands = []
    end

    def hear(matcher, &block)
      command = Command.new(matcher, block)
      @commands << command
      command
    end

    def run

      `rec -t flac -c 2 /tmp/parser.flac silence -l 1 0 0.1% 1 2.0 1% rate 16k`
      data = File.read('/tmp/parser.flac')
      utterance = Client.get(data)
      if !utterance.nil?
        match = @commands.detect { |command| command.match?(utterance) }
        if !match.nil?
          match.handler.call
        else
          puts "No match but google heard #{utterance}"
        end
      else
        puts "nothing back from google"
      end
    end
  end
end