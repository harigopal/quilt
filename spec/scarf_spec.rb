require 'spec_helper'

describe Scarf do
  subject { described_class }

  describe '.configure' do
    it 'stores configuration' do
      expect(subject.configuration.font_family).to eq(%w(sans-serif))
      expect(subject.configuration.font_weight).to eq('normal')
      expect(subject.configuration.background_shape).to eq(:circle)
      expect(subject.configuration.background_colors).to eq(described_class::Configuration::BACKGROUND)

      subject.configure do |config|
        config.font_family = ['Source Sans Pro']
        config.background_shape = :square
        config.background_colors = ['#FFFFFF', '#000000']
        config.font_weight = 'bolder'
      end

      expect(subject.configuration.font_family).to eq(['Source Sans Pro'])
      expect(subject.configuration.font_weight).to eq('bolder')
      expect(subject.configuration.background_shape).to eq(:square)
      expect(subject.configuration.background_colors).to eq(['#FFFFFF', '#000000'])

    end
  end
end
