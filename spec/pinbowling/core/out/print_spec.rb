# frozen_string_literal: true

require "spec_helper"
require "pry"

RSpec.describe Pinbowling::Core::Out::Print do
  subject { described_class.pretty(score_table) }

  describe ".run" do
    let(:players) { Pinbowling::Core::Helpers::Validators.run "full_strike.txt" }
    let(:score_table) { Pinbowling::Core::Score::Table.calculate players }

    #     it "prints the score table successfully" do
    #       expect { subject }.to output(<<-MESSAGE.strip_heredoc).to_stdout
    #      Frame    1       2       3       4       5       6       7       8       9       10
    #       Carl
    #   Pinfalls        X       X       X       X       X       X       X       X       X   X   X  X
    #      Score     30      60      90     120     150     180     210     240     270     300
    # ----------------------------------------------------------------------------------------------------
    #       MESSAGE
    #     end
  end
end
