# frozen_string_literal: true

module Pinbowling
  module Support
    # Instructions
    #
    # This class contains one method option [play],
    # which will print to the user the instructions to run the game.
    class Instructions < Thor
      desc "play", "Instructions to start a new game"
      method_option :play, aliases: "p"
      def play
        puts "To start a new game run the following command:"
        puts "pinbowling game play my_file.txt"
        puts "
          The input file .txt should contain a valid number of throws per player and valid numbers
          for each chance.
        "
        puts "
          The input file .txt should be located in the root directory from where
          the command is being run otherwise the program will throw an error saying:

          Input file does not exists!!
        "
      end
    end
  end
end
