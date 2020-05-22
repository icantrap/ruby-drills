# frozen_string_literal: true

require './lib/drills/arrays/reject'

describe Drills::Arrays::Reject do
  include DataHelper

  describe '.less_than_1000' do
    context 'given an array of numbers' do
      it 'returns an array of numbers less than 1000' do
        input = array_of_random_numbers
        expectation = input.reject { |number| number >= 1000 }

        expect(Drills::Arrays::Reject.less_than_1000(input)).to eq(expectation)
      end
    end
  end

  describe '.long_words' do
    context 'given an array of strings' do
      it 'returns an array of the strings shorter than 5 characters' do
        input = array_of_random_strings
        expectation = input.reject { |string| string.length >= 5 }

        expect(Drills::Arrays::Reject.short_words(input)).to eq(expectation)
      end
    end
  end
end
