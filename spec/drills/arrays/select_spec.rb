# frozen_string_literal: true

require './lib/drills/arrays/select'

describe Drills::Arrays::Select do
  include DataHelper

  describe '.evens' do
    context 'given an array of numbers' do
      it 'returns an array of even numbers' do
        input = array_of_random_numbers
        expectation = input.select { |number| number.even? }

        expect(Drills::Arrays::Select.evens(input)).to eq(expectation)
      end
    end
  end

  describe '.long_words' do
    context 'given an array of strings' do
      it 'returns an array of the strings longer than 5 characters' do
        input = array_of_random_strings
        expectation = input.select { |string| string.length > 5 }

        expect(Drills::Arrays::Select.long_words(input)).to eq(expectation)
      end
    end
  end
end
