require_relative './van'

class Garage

	def initialize
		@bike = []
	end

	def bike_count
		@bike.count
	end

	def unload_bikes broken_bikes
		@bike << broken_bikes
	end

	def fix_bikes broken_bikes
		@bike.delete broken_bikes
	end

	def fixed_bikes bike
		@bike << bike
	end

	def bikes_load bike
		@bike.delete bike
	end


end