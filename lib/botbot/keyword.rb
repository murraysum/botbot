module Botbot
  class Keyword

    def self.hear
      # `rec -t flac -c 2 keyword_listen.flac trim 0 00:06 rate 16k`
      `rec -t flac -c 2 /tmp/keyword_listen.flac silence -l 1 0 0.1% 1 2.0 1% rate 16k`

      data = File.read('/tmp/keyword_listen.flac')
      utterance = Client.get(data)

      if !utterance.nil? && utterance == Botbot.name
        `say #{"How can I help"}`
        yield
      end
    end
  end
end