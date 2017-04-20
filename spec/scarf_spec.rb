require 'spec_helper'

describe Scarf do
  subject { described_class }

  describe '.configure' do
    it 'stores configuration' do
      expect(subject.configuration.font_family).to eq(%w(sans-serif))

      subject.configure do |config|
        config.font_family = ['Source Sans Pro']
      end

      expect(subject.configuration.font_family).to eq(['Source Sans Pro'])
    end
  end
end
