require 'spec_helper'
require 'plateau'

describe Plateau do
  subject { described_class.new }

  it '.limit_x' do
    expect(subject.limit_x).to eq(20)
  end

  it '.limit_y' do
    expect(subject.limit_y).to eq(20)
  end
end
