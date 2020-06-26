# frozen_string_literal: true

# This set of drills deals with creating custom classes.
module Drills
  module Classes
    # Define a class Car that accepts 4 parameters on instantiation:
    # color, make, model, year as parameterized values. You should be
    # able to get and modify those values post instantiation
    class Car
      attr_accessor :make, :model, :color, :year
      def initialize(make:, model:, color:, year:)
        @make = make
        @model = model
        @color = color
        @year = year
      end
    end


  end
end
