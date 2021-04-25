module Pinbowling
  module Support
    class Instructions < Thor

      desc "how to play", "Start a new game"
      method_option :flow, aliases: "f"
      def flow
        p "To start a new game run the following command: pinbowling "
      end
    end
  end
end
