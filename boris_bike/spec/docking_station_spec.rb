require_relative './spec_helper'
require_relative '../lib/docking_station'
require_relative '../lib/bike'
require_relative '../lib/van'

describe DockingStation do

	def fill_station station
		20.times { station.dock(Bike.new) }
	end

	let(:station) { DockingStation.new({capacity: 20}) }
	let(:bike) { Bike.new }
	let(:van) {Van.new}

	it 'should be empty after we build it' do
		expect(station.bike_count).to eq 0
	end

	it 'should be able to dock a bike' do

		station.dock(bike)

		expect(station.bike_count).to eq 1
	end

	it 'should be able to realease a bike' do

		station.dock(bike)
		station.release(bike)

		expect(station.bike_count).to eq 0
  end

  it 'should know when it has reached capacity' do
  	fill_station station

  	expect(station.full?).to be true
  end

  it 'should not accept a bike if it\'s full' do
  	fill_station station

  	expect{station.dock(bike)}.to raise_error RuntimeError 
	end

	it 'should provide a list of availible bikes' do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break
		station.dock(working_bike)
		station.dock(broken_bike)

		expect(station.availible_bikes).to eq [working_bike]
	end

	it 'should load broken bikes into van' do
		broken_bike = Bike.new
		van.van_dock(broken_bike)
		expect(van.bike_count).to eq 1
	end

	it 'should lower the bike counter by the amount of broken bikes' do
		broken_bike = Bike.new
		broken_bike.break
		station.dock(broken_bike)
		station.van_dock(broken_bike)
		expect(station.bike_count).to eq 0
	end

end




