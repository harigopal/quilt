require 'spec_helper'

describe Scarf::InitialAvatar do
  describe '#svg' do
    subject { described_class.new(name, font_family: ['Source Sans Pro']) }

    let(:name) { 'Hello World' }

    it 'returns an SVG with initials in it' do
      svg = subject.svg()
      expect(svg).to match(/<svg.+'Source Sans Pro'.+HW.+<\/svg>/)
    end
  end
end
