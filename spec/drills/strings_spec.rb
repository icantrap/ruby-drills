# frozen_string_literal: true

require './lib/drills/strings'

describe Drills::Strings do
  include DataHelper

  describe '.empty' do
    it 'returns an empty string' do
      expect(Drills::Strings.empty).to be_empty
    end
  end

  describe '.with_data' do
    it 'returns a string with more than 2 characters' do
      expect(Drills::Strings.with_data.length).to be > 2
    end
  end

  describe '.alpha' do
    it 'returns a string of only alphabetic characters' do
      expect(Drills::Strings.alpha).to match(/^[a-zA-Z]+$/)
    end
  end

  describe '.numbers' do
    it 'returns a string of only numbers' do
      expect(Drills::Strings.numbers).to match(/^[0-9]+$/)
    end
  end

  describe '.mixed' do
    it 'returns a string with a mix of numbers, letters, and symbols' do
      expect(Drills::Strings.mixed).to match(/[0-9]+/)
      expect(Drills::Strings.mixed).to match(/[a-zA-Z]+/)
      expect(Drills::Strings.mixed).to match(/\W+/)
    end
  end

  describe '.arrayify' do
    it 'returns the characters in the string as an array' do
      string = random_string
      expect(Drills::Strings.arrayify(string)).to eq string.chars
    end
  end

  describe '.size' do
    it 'returns the number of characters in the string' do
      string = random_string
      expect(Drills::Strings.size(string)).to eq string.size
    end
  end

  describe '.value_in?' do
    let(:string1) { random_string }
    let(:value1) { random_string }
    let(:string2) { 'hello world' }
    let(:value2) { 'lo wo' }

    it 'returns false when the value is not in the string' do
      expect(Drills::Strings.value_in?(string1, value1)).to be false
    end

    it 'returns true when the value is in the string' do
      expect(Drills::Strings.value_in?(string1, value1)).to be true
    end
  end

  describe '.equal?' do
    let(:string1) { random_string }
    let(:string2) { random_string }

    it 'returns true if they are equal' do
      expect(Drills::Strings.equal?(string1, string1)).to be true
    end

    it 'returns false if they are not equal' do
      expect(Drills::Strings.equal?(string1, string2)).to be false
    end
  end

  describe '.combine' do
    let(:string1) { random_string }
    let(:string2) { random_string }

    it 'returns the 2 strings combined into one' do
      expect(Drills::Strings.combine(string1, string2)).to eq string1 + string2
    end
  end

  describe '.combine_with_reverse' do
    let(:string) { random_string }

    it 'returns the string combined with its reverse' do
      expect(Drills::Strings.combine_with_reverse(string)).to eq string + string.reverse
    end
  end

  describe '.separate' do
    let(:string1) { random_string }
    let(:string2) { random_string }
    let(:string3) { random_string }
    let(:s) { ['|', ',', ' ', 'a', '+', ':'].sample }

    it 'returns something stupid' do
      combined = string1 + s + string2 + s + string3

      expect(Drills::Strings.separate(combined, s)).to eq combined.split(s)
    end
  end

  describe '.uppercased' do
    let(:string) { random_string }

    it 'returns the string in uppercase' do
      expect(Drills::Strings.uppercased(string)).to eq string.upcase
    end
  end

  describe '.lowercased' do
    let(:string) { random_string }

    it 'returns the string in lowercase' do
      expect(Drills::Strings.lowercased(string)).to eq string.downcase
    end
  end

  describe '.capitalized' do
    let(:string) { random_string + ' ' + random_string}

    it 'returns the string with each word capitalized' do
      expect(Drills::Strings.capitalized(string)).to eq string.capitalize
    end
  end

  describe '.symbolized' do
    let(:string) { random_string }

    it 'returns the string as a symbol' do
      expect(Drills::Strings.symbolized(string)).to eq string.to_sym
    end
  end

  describe '.last_char' do
    let(:string) { random_string }

    it 'returns the last character in the string' do
      expect(Drills::Strings.last_char(string)).to eq string.chop
    end
  end

  describe '.remove_last_char' do
    let(:string) { random_string }

    it 'returns it with the last character removed' do
      expect(Drills::Strings.remove_last_char(string)).to eq string.chop!
    end
  end
end
