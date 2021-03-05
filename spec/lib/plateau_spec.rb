require 'spec_helper'
require 'plateau'

describe Plateau do
  subject { described_class.new }

  it '.area' do
    expect(subject.area).to eq([20, 20])
  end
end
