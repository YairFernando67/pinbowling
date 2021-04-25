module Pinbowling

  class Main < Thor
    check_unknown_options!
    def self.exit_on_failure?
      true
    end

    desc "version", "Show PinBowling version gem"
    method_option :version, aliases: "-v"
    def version
      puts VERSION
    end

    register Support::Instructions,
              "instructions",
              "instructions",
              "Start a new game"
  end
end
