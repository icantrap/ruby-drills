# frozen_string_literal: true

require './lib/drills/arrays/inject'

describe Drills::Arrays::Inject do
  include DataHelper

  describe '.sum of squares' do
    context 'given an array of numbers' do
      it 'returns the sum of their squares' do
        input = array_of_random_numbers
        expectation = input.inject { |sum, num| sum + num**2 }

        expect(Drills::Arrays::Inject.sum_of_squares(input)).to eq(expectation)
      end
    end
  end

  describe '.comma_separated_list' do
    context 'given an array of strings' do
      it 'returns a string that is all the strings separated by a comma and a space' do
        input = array_of_random_strings
        expectation = input.inject { |csl, string| csl + ', ' + string }

        expect(Drills::Arrays::Inject.comma_separated_list(input)).to eq(expectation)
      end
    end
  end
end
