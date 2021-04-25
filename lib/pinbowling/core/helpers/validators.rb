module Pinbowling
  module Core
    module Helpers
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
          valid_number_of_throws
        end

        private

        attr_accessor :file, :abs_path

        def file_exists?
          file.gsub!("./", "")
          @abs_path = Dir.pwd + "/" + file
          raise Errors::MESSAGE[:invalid_file] unless !Dir[abs_path].blank?
        end

        def valid_number_of_throws
          open_file = File.open(abs_path)
          players = open_file.readlines.map(&:chomp)
          players.each.with_object({}) do |p, memo|
            record = p.split
            value = parse_record(record[1])
            is_valid_number?(value)
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

        def is_valid_number?(num)
          raise Errors::MESSAGE[:invalid_knocked_pin_number] unless (0..10).include?(num)
        end
      end
    end
  end
end
