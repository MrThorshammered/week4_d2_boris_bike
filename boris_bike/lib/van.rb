class Van

	DEFAULT_CAPACITY = 5

	def initialize options = {}
		@bike = []
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
	end

	def bike_count
		@bike.count
	end

	def van_dock broken_bike
		@bike << broken_bike
	end

	def van_full?
		bike_count == @capacity
	end

	def van_load bike
		@bike << bike
	end

end