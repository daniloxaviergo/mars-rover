require 'spec_helper'
require 'rover'

describe Rover do
  subject { described_class.new }

  it '.to_position' do
    expect(subject.to_position(5, 5)).to eq([5, 5])
    expect(subject.to_position(50, 5)).to eq([20, 5])
    expect(subject.to_position(50, 50)).to eq([20, 20])
    expect(subject.to_position(-10, -10)).to eq([20, 20])
  end

  it '.forward' do
    subject.forward
    expect(subject.position).to eq([10, 11])

    subject.rotation.to_left
    subject.forward
    expect(subject.position).to eq([9, 11])

    subject.rotation.to_left
    subject.forward
    expect(subject.position).to eq([9, 10])

    subject.rotation.to_left
    subject.forward
    expect(subject.position).to eq([10, 10])
  end
end
