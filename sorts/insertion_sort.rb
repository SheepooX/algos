class InsertionSort

	def self.sort arr
		# How many elements from start are sorted
		pseudo_sorted = 1
		# While the array is not sorted
		while pseudo_sorted < arr.length
			i = pseudo_sorted
			# While we can move the element to the left
			while i > 0
				# Swap if the nums are in wrong order
				# if not the current num is at the right place => break
				if arr[i] < arr[i - 1]
					swapper = arr[i]
					arr[i] = arr[i - 1]
					arr[i - 1] = swapper
				else
					break
				end
				i -= 1
			end
			# After another element is correctly placed
			pseudo_sorted += 1
		end
		return arr
	end

end
