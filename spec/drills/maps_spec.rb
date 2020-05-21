# frozen_string_literal: true

require './lib/drills/maps'

describe Drills::Maps do
  include DataHelper

  describe '.squares' do
    context 'given an array of numbers' do
      it 'returns an array of the squares of those numbers' do
        input = array_of_random_numbers
        expectation = input.map { |number| number**2 }

        expect(Drills::Maps.squares(input)).to eq(expectation)
      end
    end
  end

  describe '.uppercases' do
    context 'given an array of strings' do
      it 'returns an array of the strings uppercased' do
        input = array_of_random_strings
        expectation = input.map(&:upcase)

        expect(Drills::Maps.uppercases(input)).to eq(expectation)
      end
    end
  end
end