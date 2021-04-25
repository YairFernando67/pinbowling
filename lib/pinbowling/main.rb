module Pinbowling

  class Main < Thor

    def self.exit_on_failure?
      true
    end

    desc "version", "Show PinBowling version gem"
    method_option :version, aliases: "-v"
    def version
      puts VERSION
    end
  end
end
