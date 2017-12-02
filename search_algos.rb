class SearchAlgos

	# Binary search
	# Returns nil if number is not in the array
	# Returns number as the posistion of the num in the array
	def self.binary_search arr, x
		# Set the left and right pointers
		i = 0
		j = arr.length - 1
		# While there is something between i and j
		while j >= i
			# Middle position between positions i and j
			middle = (i + j) / 2
			# Return position if found
			# else change i or j
			if x == arr[middle]
				return middle
			elsif x < arr[middle]
				j = middle - 1
			else
				i = middle + 1
			end
		end
		# If num is not in the array
		return nil
	end

end
