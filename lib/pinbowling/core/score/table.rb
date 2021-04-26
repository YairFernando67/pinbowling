# frozen_string_literal: true

module Pinbowling
  module Core
    module Score
      # Table
      #
      # This class calculates the score_table based on the
      # players input
      class Table
        class << self
          def calculate(players)
            i = new(players)
            i.perform
          end
        end

        def initialize(players)
          @players = players
          @score_table = {}
          validate!
        end

        def perform
          player_names = players.keys
          fill_score_table(player_names)
          opt_idx = 0
          players.each do |e, scores|
            @game = score_table[e]
            scores.each.with_index do |value, idx|
              if value == 10
                update_pinfalls_and_score_when_strike(value, scores, idx, opt_idx)
                update_scores
                break if opt_idx == 9
              elsif !game[:prev_score].nil?
                break if handle_prev_score(value, scores, idx, opt_idx)
              else
                update_prev_score(value)
                if opt_idx == 10
                  if game[:pinfalls][opt_idx - 1].sum == 10 || game[:pinfalls][opt_idx - 1].include?("/")
                    game[:pinfalls][opt_idx] = [value, ""]
                  end
                else
                  game[:pinfalls][opt_idx] = [value, ""]
                end
              end
              opt_idx += 1 if game[:prev_score].nil?
            end
            opt_idx = 0
          end
          score_table
        end

        private

        attr_accessor :players, :score_table, :game

        def validate!
          raise Errors::MESSAGE[:invalid_players] if players.keys.empty?
        end

        def update_prev_score(val=nil)
          game[:prev_score] = val
        end

        def update_scores
          game[:scores] << game[:score]
        end

        def update_score(val)
          game[:score] += val
        end

        def update_pinfalls_and_score_when_strike(value, scores, idx, opt_idx)
          game[:pinfalls][opt_idx] = if opt_idx == 9
                                       ["X", strike?(scores[idx + 1]), strike?(scores[idx + 2])]
                                     else
                                       ["", "X"]
                                     end
          update_score(value + scores[idx + 1] + scores[idx + 2])
        end

        def update_pinfalls_and_score_when_spare(value, scores, idx, opt_idx)
          if opt_idx == 9
            game[:pinfalls][opt_idx] = [game[:pinfalls][opt_idx][0], "/", scores[idx + 1]]
          else
            game[:pinfalls][opt_idx][1] = "/"
          end
          update_score(game[:prev_score] + value + scores[idx + 1])
        end

        def handle_prev_score(value, scores, idx, opt_idx)
          if (value + game[:prev_score]) == 10
            update_pinfalls_and_score_when_spare(value, scores, idx, opt_idx)
            update_scores
            return true if opt_idx == 9
          else
            game[:pinfalls][opt_idx][1] = value
            update_score(game[:prev_score] + value)
            update_scores
          end
          update_prev_score
          false
        end

        def fill_score_table(player_names)
          player_names.each do |n|
            score_table[n] = {
              pinfalls: Array.new(10),
              score: 0,
              scores: [],
              prev_score: nil,
              player: n
            }
          end
        end

        def strike?(val)
          val == 10 ? "X" : val
        end
      end
    end
  end
end
