# frozen_string_literal: true

require "pry"

RSpec.describe Pinbowling do
  it "contains a valid version" do
    expect(Pinbowling::VERSION).not_to be nil
  end
end
