# frozen_string_literal: true

module DataHelper
  def array_of_random_numbers(size = rand(10))
    Array.new(size) { random_number }
  end

  def array_of_random_strings(size = rand(10))
    Array.new(size) { random_string }
  end

  def random_hash
    hash = {}

    rand(10).times { hash[random_string] = random_number }

    hash
  end

  def random_number
    rand(-1000..1000)
  end

  def random_string
    characters = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    Array.new(rand(10)) { characters.sample }.join
  end

  def random_array(size = rand(10))
    [array_of_random_numbers(size),
     array_of_random_strings(size),
     (array_of_random_strings(size) + array_of_random_numbers(size))[0..size]].sample
  end
end
