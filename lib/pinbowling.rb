require "active_support/all"
require "dry/container"
require "thor"
require "parallel"
require "zeitwerk"

Loader = Zeitwerk::Loader.for_gem

Loader.enable_reloading
Loader.setup

module Pinbowling
  class Error < StandardError; end
  class << self
    def container
      @container ||= Dry::Container.new
    end
  end
end
