require_relative '../lib/van'
require_relative '../lib/bike'
require_relative '../lib/docking_station'

describe Van do

	def fill_van van
		5.times { van.van_dock(Bike.new) }
	end

	let(:van) { Van.new({capacity: 5}) }

	it 'van should be empty after we create it' do
		expect(van.bike_count).to eq 0
	end

	it 'van should accept broken bikes' do 
		broken_bike = Bike.new
		van.van_dock(broken_bike)
		expect(van.bike_count).to eq 1
	end

	it 'should know when it\'s gotten to capacity' do
		fill_van van
		expect(van.van_full?).to be true
	end

	it 'van should unload bikes to garage' do
	end



end