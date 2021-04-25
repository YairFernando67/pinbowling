require "pinbowling/version"
require "thor"

module Pinbowling
  class Error < StandardError; end
  class << self
    def container
      @container ||= Dry::Container.new
    end
  end
end
