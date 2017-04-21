require 'spec_helper'

describe Scarf::InitialAvatar do
  describe '#svg' do
    subject { described_class.new(name) }

    let(:name) { 'Hello World' }

    it 'returns an SVG with initials in it' do
      expect(subject.svg).to match(/<svg.+sans-serif.+HW.+<\/svg>/)
    end

    context 'when passed a different font family' do
      subject { described_class.new(name, font_family: ['Source Sans Pro']) }

      it 'returns an SVG with custom font' do
        expect(subject.svg).to match(/<svg.+'Source Sans Pro'.+HW.+<\/svg>/)
      end
    end

    context 'when Scarf is configured with font family' do
      before { Scarf.configure { |c| c.font_family = ['Times New Roman', 'sans-serif'] } }
      after { Scarf.configure { |c| c.font_family = %w(sans-serif) } }

      it 'returns an SVG with configured font in it' do
        expect(subject.svg).to match(/<svg.+'Times New Roman', sans-serif.+HW.+<\/svg>/)
      end
    end

    context 'when passed a different background shape' do
      subject { described_class.new(name, background_shape: :rectangle) }

      it 'returns an SVG with custom font' do
        expect(subject.svg).to match(/<svg.+<rect.+HW.+<\/svg>/)
      end
    end
  end
end
