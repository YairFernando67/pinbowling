# frozen_string_literal: true

require "spec_helper"
require "pry"

RSpec.describe Pinbowling::Core::Helpers::Validators do
  subject { described_class.run(file) }

  describe ".run" do
    let(:file) { "input2.txt" }

    it "builds the players hash successfully" do
      expect(subject).to be {}
      expect(subject.keys).to match_array(%w[Jeff John Carl Mary Paul])
    end

    context "when enter a file that does not exists" do
      let(:file) { "dummy.txt" }

      it "returns an error message" do
        expect { subject }.to raise_error(
          Pinbowling::Core::Helpers::Validators::InvalidArgumentError,
          "Input file does not exists!!"
        )
      end
    end

    context "when the file does not contain a valid content" do
      let(:file) { "bad_input.txt" }

      it "returns an error message" do
        expect { subject }.to raise_error(
          Pinbowling::Core::Helpers::Validators::InvalidArgumentError,
          "Please enter the right number of throws per player"
        )
      end
    end

    context "when the file does not contain a valid knocked pin number" do
      let(:file) { "invalid_pin_numbers.txt" }

      it "returns an error message" do
        expect { subject }.to raise_error(
          Pinbowling::Core::Helpers::Validators::InvalidArgumentError,
          "Negative numbers nor greater than 10 for knocked down pins are not allowed"
        )
      end
    end
  end
end
