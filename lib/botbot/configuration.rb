module Botbot
  class Configuration

    attr_accessor :name

    def initialize(name = nil)
      @name = name
      @debug = false
    end

    def debug?
      @debug
    end
  end
end