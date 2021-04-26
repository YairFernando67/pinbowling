require 'spec_helper'
require 'pry'

RSpec.describe Pinbowling::Core::Helpers::Validators do

  subject { described_class.run(file) }

  describe ".run" do
    let(:file) { "input2.txt" }

    it "builds the players hash successfully" do
      expect(subject).to be {}
    end

  end
end
