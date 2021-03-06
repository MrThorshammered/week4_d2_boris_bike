require_relative '../lib/garage'
require_relative '../lib/van'
require_relative '../lib/bike'

describe Garage do

	let(:garage) { Garage.new }
	let(:broken_bikes) {Bike.new}
	let(:bike) {Bike.new}
	let(:van) {Van.new}

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

	it 'should load fixed bikes onto the van' do
		garage.fixed_bikes(bike)
		garage.bikes_load(bike)
		van.van_load(bike)
		expect(garage.bike_count).to eq 0
		expect(van.bike_count).to eq 1
	end

end
