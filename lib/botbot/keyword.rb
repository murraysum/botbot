module Botbot
  class Keyword
    def self.hear
      # `rec -t flac -c 2 keyword_listen.flac trim 0 00:06 rate 16k`
      `rec -t flac -c 2 /tmp/keyword_listen.flac silence -l 1 0 0.1% 1 2.0 1% rate 16k`

      data = File.read('/tmp/keyword_listen.flac')
      hypotheses = Client.get(data)

      if !hypotheses.nil? && !hypotheses.empty?
        utterance = hypotheses.first["utterance"]
        puts "google thought you said #{utterance}"

        if utterance == Botbot.name
          `say #{"How can I help"}`
          yield
        end
      else
        puts "hypotheses was empty"
      end
    end
  end
end