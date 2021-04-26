# frozen_string_literal: true

module Pinbowling
  module Core
    module Helpers
      # Validators
      #
      # Runs a set of validations over the file to see if the
      # content is valid.
      class Validators
        class << self
          def run(file)
            i = new(file.dup)
            i.perform
          end
        end

        def initialize(file)
          @file = file
        end

        def perform
          file_exists?
          validate_throws_are_valid_numbers
          validate_number_of_throws

          players
        end

        private

        attr_accessor :file, :abs_path, :players

        def file_exists?
          file.gsub!("./", "")
          @abs_path = Dir.pwd + "/" + file
          raise Errors::MESSAGE[:invalid_file] if Dir[abs_path].blank?
        end

        def validate_number_of_throws
          values = players.values
          values.each do |v|
            if !v.include?(10)
              raise Errors::MESSAGE[:invalid_number_of_throws] unless v.size == 20
            else
              raise Errors::MESSAGE[:invalid_number_of_throws] unless sum_throws(v)
            end
          end
        end

        def sum_throws(val)
          return true if val.all?(10)

          sum = 0
          val.each do |n|
            sum += if n != 10
                     1
                   else
                     2
                   end
          end
          [22, 21].include? sum
        end

        def validate_throws_are_valid_numbers
          open_file = File.open(abs_path)
          @players = open_file.readlines.map(&:chomp)
          @players = players.each.with_object({}) do |p, memo|
            record = p.split
            value = parse_record(record[1])
            valid_number?(value)
            if memo[record[0]]
              memo[record[0]] << value
            else
              memo[record[0]] = [value]
            end
          end
        end

        def parse_record(record)
          record == "F" ? 0 : record.to_i
        end

        def valid_number?(num)
          raise Errors::MESSAGE[:invalid_knocked_pin_number] unless (0..10).include?(num)
        end
      end
    end
  end
end
