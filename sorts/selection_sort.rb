class SelectionSort

	def self.sort arr
		# How many nums are in the right order
		sorted = 0
		while sorted < arr.length
			i = sorted
			i_min = i
			# Find the smallest num
			while i < arr.length - 1
				i_min = i if arr[i] < arr[i_min]
				i += 1
			end
			# Swap it
			swapper = arr[i_min]
			arr[i_min] = arr[sorted]
			arr[sorted] = swapper
			sorted += 1
		end
		return arr
	end

end
