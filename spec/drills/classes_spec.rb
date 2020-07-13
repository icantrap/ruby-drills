# frozen_string_literal: true

require './lib/drills/classes'

describe Drills::Classes::Car do
  include DataHelper

  let(:car) { Drills::Classes::Car.new(make: 'make', model: 'model', color: 'color', year: 'year') }

  describe '#initialize' do

    it 'returns an object of class Car' do

      expect(car).to be_instance_of Drills::Classes::Car
    end

    it 'has a make' do
      expect(car.make).to eq 'make'
    end

    it 'has a model' do
      expect(car.model).to eq 'model'
    end

    it 'has a color' do
      expect(car.color).to eq 'color'
    end

    it 'has a year' do
      expect(car.year).to eq 'year'
    end
  end
end
