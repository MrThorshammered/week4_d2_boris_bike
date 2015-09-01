require_relative '../lib/garage'
require_relative '../lib/van'
require_relative '../lib/bike'

describe Garage do

	let(:garage) { Garage.new }
	let(:broken_bikes) {Bike.new}

	it 'should unload bikes from van' do
		broken_bikes 
		garage.unload_bikes(broken_bikes)

		expect(garage.bike_count).to eq 1
	end

	it 'should fix the bikes' do
		broken_bikes
		garage.unload_bikes(broken_bikes)

		garage.fix_bikes(broken_bikes)
		garage.fixed_bikes(bike)

		expect(garage.bike_count).to eq 1

	end

end
