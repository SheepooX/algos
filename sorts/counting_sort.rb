class CountingSort

	def self.sort arr, min, max
		# Create an array of required size, +1 => if max is in arr
		counting_arr = Array.new(max - min + 1, 0)
		# Count the occurences of each integer
		arr.each do |num|
			# num - min gives the right index
			# min = -3, max = 5, max - min = 8
			# -3: -3 -(-3) = 0
			# 5: 5 -(-3) => 8
			counting_arr[num - min] += 1
		end
		# Repopulate the array
		index = 0
		counting_arr.each_index do |i|
			counting_arr[i].times do
				# Recalculate the values based on the index
				arr[index] = i + min
				index += 1
			end
		end
		return arr
	end

end
