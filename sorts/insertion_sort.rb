class InsertionSort

	# About 30% faster
	def self.sort arr
		(1...arr.length).each do |i|
			tmp = arr[i]
			j = i
			while j > 0 and arr[j - 1] > tmp
				arr[j] = arr[j - 1]
				j -= 1
			end
			arr[j] = tmp
		end
		return arr
	end

	def self.sort_slower arr
		# How many elements from start are sorted
		pseudo_sorted = 1
		# While the array is not sorted
		while pseudo_sorted < arr.length
			i = pseudo_sorted
			# While we can move the element to the left
			# and the element to the right is bigger
			# keep swapping
			while i > 0 and arr[i - 1] > arr[i]
				swapper = arr[i]
				arr[i] = arr[i - 1]
				arr[i - 1] = swapper
				i -= 1
			end
			# After another element is correctly placed
			pseudo_sorted += 1
		end
		return arr
	end

end
