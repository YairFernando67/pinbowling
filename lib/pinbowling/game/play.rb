# frozen_string_literal: true

module Pinbowling
  module Game
    # Play
    #
    # This class contains one class option [play] that will
    # take a file name as an argument in order to start a new game
    class Play < Thor::Group
      include Thor::Actions

      class_option :play, aliases: "p", desc: "Startr a new game"
      argument :file, type: :string, required: true, desc: ".txt File with the players and frame"
      def play
        @file = file
        @players = Core::Helpers::Validators.run(file)
        @score_table = Core::Score::Table.calculate(@players)
        Core::Out::Print.pretty(@score_table)
      end

      attr_accessor :file
    end
  end
end
