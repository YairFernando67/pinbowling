module Pinbowling
  module Game
    class Start < Thor

      desc "new game", "Start a new game"
      method_option :start, aliases: "s"
      def start
        p "Game started"
      end
    end
  end
end
