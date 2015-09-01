require_relative '../lib/van'

describe Van do

	it 'van should be empty after we create it' do
		van = Van.new
		expect(van.bike_count).to eq 0
	end

	it 'van should accept broken bikes' do 
		van = Van.new
		van.dock(broken_bike)
		expect(van.bike_count).to eq 1
	end

end