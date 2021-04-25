module Pinbowling
  module Game
    class Module < Thor
      register ::Play,
               "play",
               "play [.TXT FILE]",
               "Start a new game"
    end
  end
end
