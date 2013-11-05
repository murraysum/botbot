module Botbot
  class Configuration

    attr_accessor :name, :debug

    def initialize(name = nil)
      @name = name
      @debug = false
    end

    def debug?
      @debug
    end
  end
end