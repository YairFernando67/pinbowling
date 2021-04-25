module Pinbowling
  module Support
    class Instructions < Thor::Group
      include Thor::Actions

      desc "Start a new game"
      method_option :start, aliases: "-h"
      def start
        p "To start a new game run the following command: pinbowling "
      end
    end
  end
end
