class SearchAlgos

	# Binary search
	# Returns nil if number is not in the array
	# Otherwise it returns the numbers position
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

	def self.recursive_binary_search arr, x, left = 0, right = arr.length - 1
		return nil unless right >= left
		middle = (left + right) / 2
		if arr[middle] == x
			return middle
		elsif x < arr[middle]
			return recursive_binary_search(arr, x, left, middle - 1)
		else
			return recursive_binary_search(arr, x, middle + 1, right)
		end
	end

end
