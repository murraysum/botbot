module Botbot
  class Senses

    def self.listen
      `rec -t flac -c 2 /tmp/botbot.flac silence -l 1 0 0.1% 1 2.0 1% rate 16k`
      data = File.read('/tmp/botbot.flac')
      utterance = Client.get(data)
    end

    def self.say(message)
      `say "#{message}"`
    end
  end
end