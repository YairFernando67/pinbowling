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
          validate!
        end

        def perform
          score_table = {}
          player_names = players.keys
          player_names.each do |n|
            score_table[n] = {
                                pinfalls: Array.new(10),
                                score: 0,
                                scores: [],
                                prev_score: nil,
                                player: n
                              }
          end
          i = 0
          players.each do |e, scores|
            game = score_table[e]
            scores.each.with_index do |s, idx|
              if s == 10
                if i == 9
                  update_pinfalls_and_score(game, ["X", scores[idx+1], scores[idx+2]], s, scores, idx, i)
                  update_scores(game)
                  break
                else
                  update_pinfalls_and_score(game, ["", "X"], s, scores, idx, i)
                  update_scores(game)
                end
              else
                if !game[:prev_score].nil?
                  if (s + game[:prev_score]) == 10
                    if i == 9
                      game[:pinfalls][i] = [game[:pinfalls][i][0], "/", scores[idx+1]]
                      game[:score] += (game[:prev_score]+s+scores[idx+1])
                      update_scores(game)
                      break
                    else
                      game[:pinfalls][i][1] = "/"
                      game[:score] += (game[:prev_score]+s+scores[idx+1])
                      update_scores(game)
                    end
                  else
                    game[:pinfalls][i][1] = s
                    game[:score] += (game[:prev_score]+s)
                    update_scores(game)
                  end
                  update_prev_score(game, nil)
                else
                  update_prev_score(game, s)
                  game[:pinfalls][i] = [s, ""]
                end
              end
              i +=1 if game[:prev_score].nil?
            end
            i = 0
          end
          binding.pry
        end

        private

        attr_accessor :players

        def validate!
          raise Errors::MESSAGE[:invalid_players] unless players.keys.size > 0
        end

        def update_prev_score(game, val)
          game[:prev_score] = val
        end

        def update_scores(game)
          game[:scores] << game[:score]
        end

        def update_pinfalls_and_score(game, val, s, scores, idx, i)
          game[:pinfalls][i] = val
          game[:score] += (s + scores[idx+1] + scores[idx+2])
        end

      end
    end
  end
end
