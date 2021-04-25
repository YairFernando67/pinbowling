module Pinbowling
  module Core
    module Score
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
          i = 0
          players.each do |e, scores|
            @game = score_table[e]
            scores.each.with_index do |s, idx|
              if s == 10
                update_pinfalls_and_score_when_strike(s, scores, idx, i)
                update_scores
                break if i == 9
              else
                if !game[:prev_score].nil?
                  if (s + game[:prev_score]) == 10
                    update_pinfalls_and_score_when_spare(s, scores, idx, i)
                    update_scores
                    break if i == 9
                  else
                    game[:pinfalls][i][1] = s
                    update_score(game[:prev_score]+s)
                    update_scores
                  end
                  update_prev_score
                else
                  update_prev_score(s)
                  game[:pinfalls][i] = [s, ""]
                end
              end
              i +=1 if game[:prev_score].nil?
            end
            i = 0
          end
          score_table
        end

        private

        attr_accessor :players, :score_table, :game

        def validate!
          raise Errors::MESSAGE[:invalid_players] unless players.keys.size > 0
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

        def update_pinfalls_and_score_when_strike(s, scores, idx, i)
          if i == 9
            game[:pinfalls][i] = ["X", scores[idx+1], scores[idx+2]]
          else
            game[:pinfalls][i] = ["", "X"]
          end
          update_score(s + scores[idx+1] + scores[idx+2])
        end

        def update_pinfalls_and_score_when_spare(s, scores, idx, i)
          if i == 9
            game[:pinfalls][i] = [game[:pinfalls][i][0], "/", scores[idx+1]]
          else
            game[:pinfalls][i][1] = "/"
          end
          update_score(game[:prev_score]+s+scores[idx+1])
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
      end
    end
  end
end
