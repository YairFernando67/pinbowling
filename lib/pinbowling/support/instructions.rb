module Pinbowling
  module Support
    class Instructions < Thor

      desc "play", "Instructions to start a new game"
      method_option :play, aliases: "p"
      def play
        p "To start a new game run the following command: pinbowling "
      end
    end
  end
end
