class TechniqueAlgos

	# Even nums to the left, odd nums to the right
	def self.divide_even_odd arr
		# Pointer from left right
		i = 0
		j = arr.length - 1
		# Find the first pair two swap
		i += 1 until arr[i] % 2 == 1 or i >= arr.length - 1
		j -= 1 until arr[j] % 2 == 0 or j < 1
		# Until no pairs are found
		while i < j
			swapper = arr[i]
			arr[i] = arr[j]
			arr[j] = swapper
			# Find the next pair
			i += 1 until arr[i] % 2 == 1 or i >= arr.length - 1
			j -= 1 until arr[j] % 2 == 0 or j < 1
		end
		arr
	end

	# Recursively swap the elements of an array
	def self.reverse_arr(arr, left = 0, right = arr.length - 1)
		return arr if left >= right
		swapper = arr[left]
		arr[left] = arr[right]
		arr[right] = swapper
		return reverse_arr arr, left + 1, right - 1
	end

end

