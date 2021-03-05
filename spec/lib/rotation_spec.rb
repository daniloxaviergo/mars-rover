require 'spec_helper'
require 'rotation'

describe Rotation do
  subject { described_class.new() }

  it '.to_right' do
    expect(subject.to_right).to eq(270)
    expect(subject.to_right).to eq(180)
    expect(subject.to_right).to eq(90)
    expect(subject.to_right).to eq(0)
    expect(subject.to_right).to eq(270)
  end

  it '.to_left' do
    expect(subject.to_left).to eq(90)
    expect(subject.to_left).to eq(180)
    expect(subject.to_left).to eq(270)
    expect(subject.to_left).to eq(0)
    expect(subject.to_left).to eq(90)
  end

  it '.to_cardinal' do
    directions = {
      n: 0,
      s: 180,
      w: 90,
      e: 270
    }

    directions.keys.each do |key|
      expect(subject.to_cardinal(key.to_s)).to eq(directions[key])
    end
  end

  it 'direction is west and rotation to left' do
    subject.to_cardinal('w')
    expect(subject.to_left).to eq(180)
  end

  it 'direction is south and rotation to right' do
    subject.to_cardinal('s')
    expect(subject.to_right).to eq(90)
  end
end
