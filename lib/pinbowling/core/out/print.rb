# frozen_string_literal: true

require "awesome_print"

module Pinbowling
  module Core
    module Out
      # Print
      #
      # Prints the score_table to the user with the palyers
      # scores and total results for one game.
      class Print < Base
        def perform
          puts "Frame".rjust(10) + "".rjust(4) + (1..10).map { |e| e.to_s.ljust(8) }.join(",").gsub(",", "").to_s
          score_table.each do |e, i|
            puts e.to_s.rjust(10)
            puts "Pinfalls".rjust(10) + "".rjust(4) + i[:pinfalls]
              .map(&method(:format_throws))
              .join(",")
              .gsub(",", "  ")
              .to_s
            puts "Score".rjust(10) + "".rjust(4) + i[:scores]
              .map { |a| a.to_s.center(4) }
              .join(",")
              .gsub(",", "    ")
              .to_s
            100.times { print "-" }
            puts "\n"
          end
        end

        private

        def format_throws(arr)
          arr[0] = arr[0].to_s.ljust(3)
          arr[1] = arr[1].to_s.ljust(2)
          arr.join(",").gsub(",", " ")
        end
      end
    end
  end
end
