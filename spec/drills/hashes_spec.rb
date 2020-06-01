# frozen_string_literal: true

require './lib/drills/hashes'

describe Drills::Hashes do
  include DataHelper

  describe '.empty' do
    it 'returns an empty hash' do
      actual = Drills::Hashes.empty

      expect(actual).to eql({})
    end
  end

  describe '.with_data' do
    it 'returns a hash with more than two key-value pairs' do
      actual = Drills::Hashes.with_data

      expect(actual).to be_a(Hash)
      expect(actual.size).to be > 2
    end
  end

  describe '.string_keys' do
    it 'returns a hash where all keys are strings' do
      actual = Drills::Hashes.string_keys

      expect(actual).to be_a(Hash)
      expect(actual).to_not be_empty
      expect(actual.keys).to all(be_a(String))
    end
  end

  describe '.number_keys' do
    it 'returns a hash where all keys are numbers' do
      actual = Drills::Hashes.number_keys

      expect(actual).to be_a(Hash)
      expect(actual).to_not be_empty
      expect(actual.keys).to all(be_a(Numeric))
    end
  end

  describe '.symbol_keys' do
    it 'returns a hash where all keys are symbols' do
      actual = Drills::Hashes.symbol_keys

      expect(actual).to be_a(Hash)
      expect(actual).to_not be_empty
      expect(actual.keys).to all(be_a(Symbol))
    end
  end

  describe '.mixed_keys' do
    it 'returns a hash where one key is the symbol and another is the the string version' do
      actual = Drills::Hashes.mixed_keys
      pass = actual.keys.any? do |key|
        (key.is_a?(String) && actual.has_key?(key.to_sym)) ||
          (key.is_a?(Symbol) && actual.has_key?(key.to_s))
      end

      expect(actual).to be_a(Hash)
      expect(pass).to be_truthy
    end
  end

  describe '.array_key' do
    it 'returns a hash where one key is a non-empty array' do
      actual = Drills::Hashes.array_key
      target = actual.keys.detect { |key| key.is_a?(Array) && !key.empty? }

      expect(actual).to be_a(Hash)
      expect(target).to_not be_nil
    end
  end

  describe '.array_value' do
    it 'returns a hash where one value is a non-empty array' do
      actual = Drills::Hashes.array_value
      target = actual.values.detect { |key| key.is_a?(Array) && !key.empty? }

      expect(actual).to be_a(Hash)
      expect(target).to_not be_nil
    end
  end

  describe '.hash_value' do
    it 'returns a hash where one value is a non-empty hash' do
      actual = Drills::Hashes.hash_value
      target = actual.values.detect { |key| key.is_a?(Hash) && !key.empty? }

      expect(actual).to be_a(Hash)
      expect(target).to_not be_nil
    end
  end

  describe '.nil_value' do
    it 'returns a hash where one value is nil' do
      actual = Drills::Hashes.nil_value

      expect(actual).to be_a(Hash)
      expect(actual.values).to include(be_nil)
    end
  end

  describe '.keys' do
    it 'returns the hash keys' do
      input = random_hash
      actual = Drills::Hashes.keys(input)

      expect(actual).to be_an(Array)
      expect(actual).to eql(input.keys)
    end
  end

  describe '.values' do
    it 'returns the hash values' do
      input = random_hash
      actual = Drills::Hashes.values(input)

      expect(actual).to be_an(Array)
      expect(actual).to eql(input.values)
    end
  end

  describe '.size' do
    it 'returns the hash size' do
      input = random_hash
      actual = Drills::Hashes.size(input)

      expect(actual).to eql(input.size)
    end
  end

  describe '.get_first_name' do
    it 'returns the first name' do
      expected = random_string
      input = { 'first_name' => expected }
      actual = Drills::Hashes.get_first_name(input)

      expect(actual).to eql(expected)
    end
  end

  describe '._16' do
    it 'returns the 16' do
      expected = random_number
      input = { 16 => expected }
      actual = Drills::Hashes._16(input)

      expect(actual).to eql(expected)
    end
  end

  describe '.value_of' do
    it 'returns the value' do
      input = random_hash
      key = input.keys.sample
      expected = input[key]
      actual = Drills::Hashes.value_of(input, key)

      expect(actual).to eql(expected)
    end
  end

  describe '.key_exists?' do
    let(:input) { random_hash }

    context 'where the key does exist' do
      it 'returns true' do
        key = input.keys.sample
        actual = Drills::Hashes.key_exists?(input, key)

        expect(actual).to be_truthy
      end
    end

    context 'where the key does not exist' do
      it 'returns false' do
        key = 5
        actual = Drills::Hashes.key_exists?(input, key)

        expect(actual).to be false
      end
    end
  end

  describe '.set_first_name' do
    it 'sets the first name' do
      hash = { 'first_name' => random_string }
      value = random_string

      Drills::Hashes.set_first_name(hash, value)

      expect(hash).to eql({ 'first_name' => value })
    end
  end

  describe '.equal?' do
    let(:hash1) { random_hash }
    let(:hash2) { hash1.merge({ fake: 'news' }) }

    context 'where the two hashes are equal' do
      it 'returns true' do
        actual = Drills::Hashes.equal?(hash1, hash1)

        expect(actual).to be_truthy
      end
    end

    context 'where the two hashes are not equal' do
      it 'returns false' do
        actual = Drills::Hashes.equal?(hash1, hash2)

        expect(actual).to be false
      end
    end
  end

  describe '.combine' do
    it 'combines the hashes' do
      hash1 = random_hash
      hash2 = random_hash
      actual = Drills::Hashes.combine(hash1, hash2)
      expected = hash1.merge(hash2)

      expect(actual).to eql(expected)
    end
  end
end