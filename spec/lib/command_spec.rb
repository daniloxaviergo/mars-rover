require 'spec_helper'
require 'command'

describe Command do
  let(:instructions) { File.open('spec/support/instructions.txt').read }
  subject { described_class.new(instructions) }

  it '.execute' do
    subject.execute

    expect(subject.output.length).to eq(2)
    expect(subject.output[0]).to eq('1 3 N')
    expect(subject.output[1]).to eq('5 1 E')
  end
end
