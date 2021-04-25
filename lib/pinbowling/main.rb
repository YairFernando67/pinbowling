module Pinbowling

  class Main < Thor
    check_unknown_options!
    def self.exit_on_failure?
      true
    end

    desc "TARGET_DIR", "List all files in directory and subdirectories"
    def list(target_dir)
      p target_dir.class
      puts "Listing files in #{target_dir} now"
    end

    map %w[--version -v] => :version
    desc "--version | -v", "Show PinBowling version gem"
    method_option :version, aliases: "v"
    def version
      puts VERSION
    end

    register Support::Instructions,
              "support",
              "support",
              "Support"

    register Game::Module,
              "game",
              "game",
              "Pinbowling Game"
  end
end
