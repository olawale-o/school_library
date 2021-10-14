require_relative 'spec_helper'

describe Corrector do
  let(:corrector) { Corrector.new }
  describe '#correct_name' do
    it 'returns a capitalized name' do
      expect(corrector.correct_name('polina')).to eq 'Polina'
    end

    it 'returns ten characters name' do
      expect(corrector.correct_name('Polina Stamenova')).to eq 'Polina sta'
    end
  end
end
