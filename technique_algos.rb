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

	# Reverse array
	def self.reverse_arr(arr)
		left = 0
		right = arr.length - 1
		limit = arr.length / 2
		until left >= right
			tmp = arr[left]
			arr[left] = arr[right]
			arr[right] = tmp
			left += 1
			right -= 1
		end
		arr
	end

	# Recursively swap the elements of an array
	def self.reverse_arr_recursively(arr, left = 0, right = arr.length - 1)
		return arr if left >= right
		tmp = arr[left]
		arr[left] = arr[right]
		arr[right] = tmp
		return reverse_arr_recursively arr, left + 1, right - 1
	end

end

puts (TechniqueAlgos.reverse_arr [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]).to_s
require 'benchmark'

Benchmark.bm do |bm|

	bm.report "Nor" do
		1000000.times do
			TechniqueAlgos.reverse_arr([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16])
		end
	end

	bm.report "Rec" do
		1000000.times do
			TechniqueAlgos.reverse_arr_recursively([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16])
		end
	end

end
