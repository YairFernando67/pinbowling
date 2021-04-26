# frozen_string_literal: true

module Pinbowling
  module Game
    # Module
    #
    # This class module registers the Play thor group
    class Module < Thor
      register Play,
               "play",
               "play [.TXT FILE]",
               "Start a new game"
    end
  end
end
