# frozen_string_literal: true

require "awesome_print"

module Pinbowling
  module Core
    module Out
      # Base
      #
      # This is the Base class for printing the score_table to the user
      # any class that wants to print the score_table to the user
      # must implement the perform method and implement their own
      # implementation of this method. This adds the ability to add multiple
      # classes that print the score_table in different ways.
      class Base
        class << self
          def pretty(score_table)
            i = new(score_table)
            i.perform
          end
        end

        def initialize(score_table)
          @score_table = score_table
          validate!
        end

        def perform
          raise NotImplementedError, "#{self.class} has not implemented #{__method__}"
        end

        private

        attr_accessor :score_table

        def validate!
          raise Errors::MESSAGE[:invalid_score_table] if score_table.keys.empty?
        end
      end
    end
  end
end
