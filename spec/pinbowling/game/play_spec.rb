require 'spec_helper'

RSpec.describe Pinbowling::Game::Play do
  subject { described_class.new(file).play }
end
