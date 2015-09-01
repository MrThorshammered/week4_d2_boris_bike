class DockingStation

	DEFAULT_CAPACITY = 5

	def initialize options = {}
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes = []
	end

	def bike_count
		@bikes.count 
	end

	def dock bike
		raise 'Station is full' if full?
		@bikes << bike
	end

	def release bike
		@bikes.delete bike
	end

	def full?
		bike_count == @capacity
	end

	def availible_bikes
		@bikes.reject {|bike| bike.broken? }
	end

	def van_load
		@bikes.select { |bike| bike.broken? }
		van.van_dock(broken_bike)
	end

	def van_dock broken_bike
		@bikes.delete broken_bike
	end

end