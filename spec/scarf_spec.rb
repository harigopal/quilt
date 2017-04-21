require 'spec_helper'

describe Scarf do
  subject { described_class }

  describe '.configure' do
    it 'stores configuration' do
      expect(subject.configuration.font_family).to eq(%w(sans-serif))
      expect(subject.configuration.background_shape).to eq(:circle)

      subject.configure do |config|
        config.font_family = ['Source Sans Pro']
        config.background_shape = :rectangle
      end

      expect(subject.configuration.font_family).to eq(['Source Sans Pro'])
      expect(subject.configuration.background_shape).to eq(:rectangle)
    end
  end
end
