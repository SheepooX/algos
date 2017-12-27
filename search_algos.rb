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

	def self.simple_text_search text, frag
		i = 0
		j = 0
		# Until the i is out of bounds or the fragment is found
		while i < text.length and j < frag.length
			# If it does not equal reset and put i at the proper posistion
			# text = "xxxxr", frag = "xxxr"
			# i j
			# 0 0
			# 1 1
			# 2 2
			# 3 3 # mismatch
			# 1 0
			# 2 1
			# 3 2
			# 4 3
			# 4 4 # FOUND frag
			if text[i] != frag[j]
				i -= 1
				j = -1
			end
			i += 1
			j += 1
		end
		j == frag.length ? true : false
	end

end
