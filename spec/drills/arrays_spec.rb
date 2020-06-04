# frozen_string_literal: true

require './lib/drills/arrays'

describe Drills::Arrays do
  include DataHelper

  describe '.empty' do
    it 'returns an empty array' do
      actual = Drills::Arrays.empty

      expect(actual).to eql([])
    end
  end

  describe '.with_data' do
    it 'returns an array with more than two elements' do
      actual = Drills::Arrays.with_data

      expect(actual).to be_a(Array)
      expect(actual.size).to be > 2
    end
  end

  describe '.strings' do
    it 'returns an array where all of the elements are strings' do
      actual = Drills::Arrays.strings

      expect(actual).to be_a(Array)
      expect(actual).to_not be_empty
      expect(actual).to all(be_a(String))
    end
  end

  describe '.numbers' do
    it 'return an array where all of the elements are numbers' do
      actual = Drills::Arrays.numbers

      expect(actual).to be_a(Array)
      expect(actual).to_not be_empty
      expect(actual).to all(be_a(Numeric))
    end
  end

  describe '.symbols' do
    it 'returns an array where all of the elements are symbols' do
      actual = Drills::Arrays.symbols

      expect(actual).to be_a(Array)
      expect(actual).to_not be_empty
      expect(actual).to all(be_a(Symbol))
    end
  end

  describe '.mixed' do
    it 'returns an array where one of elements is a symbol and one of the elements is the same symbol stringified' do
      actual = Drills::Arrays.mixed
      pass = actual.any? do |element|
        (element.is_a?(String) && actual.include?(element.to_sym)) ||
          (element.is_a?(Symbol) && actual.include?(element.to_s))
      end

      expect(actual).to be_a(Array)
      expect(pass).to be_truthy
    end
  end

  describe '.arrays' do
    it 'returns an array where one of the elements is a non-empty arra' do
      actual = Drills::Arrays.arrays
      target = actual.detect { |elem| elem.is_a?(Array) && !elem.empty? }

      expect(actual).to be_a(Array)
      expect(target).to_not be_nil
    end
  end

  describe '.hashes' do
    it 'returns an array where one of the elements is a non-empty hash' do
      actual = Drills::Arrays.hashes
      target = actual.detect { |elem| elem.is_a?(Hash) && !elem.empty? }

      expect(actual).to be_a(Array)
      expect(target).to_not be_nil
    end
  end

  describe '.nils' do
    it 'returns an array where one of the elements is nil' do
      actual = Drills::Arrays.nils

      expect(actual).to be_a(Array)
      expect(actual).to include(nil)
    end
  end

  describe '.stringify' do
    it 'returns the elements in the array in a string separated by spaces' do
      input    = random_array
      expected = input.join(' ')
      actual   = Drills::Arrays.stringify(input)

      expect(actual).to be_a(String)
      expect(actual).to eql(expected)
    end
  end

  describe '.size' do
    it 'returns the array size' do
      input = random_array
      actual = Drills::Arrays.size(input)

      expect(actual).to eql(input.size)
    end
  end

  describe '.get_last_element' do
    it 'returns the last element in the array' do
      input = random_array
      actual = Drills::Arrays.get_last_element(input)

      expect(actual).to eql(input.last)
    end
  end

  describe '.fifth' do
    it 'returns the fifth element' do
      input     = random_array(10)
      expected  = input[4]
      actual    = Drills::Arrays.fifth(input)

      expect(actual).to eql(expected)
    end
  end

  describe '.value_in?' do
    it 'returns whether the value is in the array' do
      input = random_array
      value = random_number
      expected = input.include? value
      actual = Drills::Arrays.value_in?(input, value)

      expect(actual).to eql(expected)
    end
  end

  describe '.set_third_element' do
    it 'sets the 3rd element to the value' do
      array = random_array(rand(3..10))
      value = [random_string, random_number, random_array, random_hash].sample

      actual = Drills::Arrays.set_third_element(array, value)

      expect(actual[2]).to eql(value)
    end
  end

  describe '.equal?' do
    let(:array1) { random_array }
    let(:array2) { array1 << random_string }

    context 'where the two arrays are equal' do
      it 'returns true' do
        actual = Drills::Arrays.equal?(array1, array1)

        expect(actual).to be_truthy
      end
    end

    context 'where the two arrays are not equal' do
      it 'returns false' do
        actual = Drills::Arrays.equal?(array1, array2)

        expect(actual).to be false
      end
    end
  end

  describe '.combine' do
    it 'combines the arrays' do
      array1 = random_array
      array2 = random_array
      actual = Drills::Arrays.combine(array1, array2)
      expected = array1 + array2

      expect(actual).to eql(expected)
    end
  end
end
