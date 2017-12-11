class BubbleSort

	def self.sort2 arr
		(1...arr.length).each do |i|
			j = arr.length - 1
			while j >= i
				if arr[j] < arr[j - 1]
					tmp = arr[j - 1]
					arr[j - 1] = arr[j]
					arr[j] = tmp
				end
				j -= 1
			end
		end
	end

	def self.sort(arr)
		# Limits the BubbleSort at the end of the array
		limit = 1
		sorted = true
		begin
			i = 0
			sorted = true
			# Every pass another element at the end is at it's right place
			# so it is unnecessary to check if they are sorted
			while i < arr.length - limit
				# If the nums are in wrong order
				if arr[i] > arr[i + 1]
					# Mark the array unsorted and swap the nums
					sorted = false
					swapper = arr[i]
					arr[i] = arr[i + 1]
					arr[i + 1] = swapper
				end
				i += 1
			end
			# After one pass increase the limit
			limit += 1
		# While the array is not sorted and the limit isn't bigger than array size
		end while limit < arr.length && !sorted
		return arr
	end

end
