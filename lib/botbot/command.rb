module Botbot

  class Command
    attr_reader :matcher, :handler

    def initialize(matcher, handler)
      if matcher.is_a?(String)
        @matcher = Regexp.new("^#{matcher}$", Regexp::IGNORECASE)
      else
        @matcher = matcher
      end
      @handler = handler
    end

    def match?(utterance)
      !(utterance =~ matcher).nil?
    end
  end
end

