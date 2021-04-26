# frozen_string_literal: true

require "spec_helper"
require "pry"

RSpec.describe Pinbowling::Core::Score::Table do
  subject { described_class.calculate(players) }

  describe ".run" do
    let(:players) { Pinbowling::Core::Helpers::Validators.run "input2.txt" }

    it "builds score table hash successfully" do
      expect(subject).to be {}
      expect(subject.keys).to match_array(%w[Jeff John Carl Mary Paul])
      subject.each do |player, scores|
        expect(scores[:pinfalls]).to be_an_instance_of(Array)
        expect(scores[:scores].size).not_to be(0)
        expect(scores[:player]).to eq(player)
      end
    end

    context "when pass an invalid players argument" do
      let(:players) { {} }

      it "returns an error message" do
        expect { subject }.to raise_error(
          Pinbowling::Core::Score::Table::InvalidArgumentError,
          "Unable to calculate score table without any players"
        )
      end
    end
  end
end
