module Pinbowling
  module Errors
    MESSAGE = {
      invalid_file: "Input file does not exists!!",
      invalid_knocked_pin_number: "Negative numbers nor greater than 10 for knocked down pins are not allowed",
      invalid_players: "Unable to calculate score table without any players",
      invalid_score_table: "Unable to print the score table without any players"
    }
  end
end


# Handle invalid score value example 6 and then 6. that should not be allowed.
# Handle invalid number of throws
