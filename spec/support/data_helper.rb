# frozen_string_literal: true

module DataHelper
  def array_of_random_numbers
    Array.new(rand(1000)) { random_number }
  end

  def array_of_random_strings
    Array.new(rand(1000)) { random_string }
  end

  def random_number
    rand(-1000..1000)
  end

  def random_string
    characters = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    Array.new(rand(1000)) { characters.sample }.join
  end
end