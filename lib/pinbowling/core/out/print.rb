require 'awesome_print'

module Pinbowling
  module Core
    module Out
      class Print
        class << self
          def pretty(score_table)
            i = new(score_table)
            i.perform
          end
        end

        def initialize(score_table)
          @score_table = score_table
        end

        def perform
          puts "Frame".rjust(10) + "".rjust(4) + "#{(1..10).map {|e| e.to_s.ljust(8)}.join(",").gsub(",", "")}"
          score_table.each do |e, i|
            puts e.to_s.rjust(10)
            puts "Pinfalls".rjust(10) + "".rjust(4) + "#{i[:pinfalls].map(&method(:format_throws)).join(",").gsub(",", "  ")}"
            puts "Score".rjust(10) + "".rjust(4) + "#{i[:scores].map{|e| e.to_s.center(4)}.join(",").gsub(",", "    ")}"
            100.times{print "-"}
            puts "\n"
          end
        end

        private

        attr_accessor :players, :score_table

        def validate!
          raise Errors::MESSAGE[:invalid_score_table] unless score_table.keys.size > 0
        end

        def format_throws(arr)
          arr[0] = arr[0].to_s.ljust(3)
          arr[1] = arr[1].to_s.ljust(2)
          arr.join(",").gsub(",", " ")
        end
      end
    end
  end
end
