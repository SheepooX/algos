class HeapSort

	def self.sort arr
		# Create the heap, biggest num on top
		arr = heapify arr
		puts arr.to_s
		heap_size = arr.length - 1
		# Until the heap is destroyed
		until heap_size <= 1
			# Put the top element at the end ([heap_size])
			swapper = arr[heap_size]
			arr[heap_size] = arr[1]
			arr[1] = swapper
			pos = 1
			heap_size -= 1
			# Fix the heap, put the largest element on the top of the heap
			# Until we have reached the end of heap
			until pos >= heap_size
				# Positions of the children
				child1 = pos * 2
				child2 = child1 + 1
				# To prevent out of bounds error
				child1 = pos if child1 > heap_size
				child2 = pos if child2 > heap_size
				# Break if there is no bigger child than parent
				break if arr[pos] >= arr[child1] and arr[pos] >= arr[child2]
				# Choose the bigger child to put up and swap it with parent
				if arr[child2] > arr[child1]
					swapper = arr[child2]
					arr[child2] = arr[pos]
					arr[pos] = swapper
					pos = child2
				else
					swapper = arr[child1]
					arr[child1] = arr[pos]
					arr[pos] = swapper
					pos = child1
				end
			end
		end
		arr[1, arr.length]
	end

	# Create a heap with the biggest num on top
	def self.heapify arr
		# Prepend an nil element at the 0th index
		# => [nil, 9, 5, 4, ...]
		arr.insert 0, nil
		heap_size = 2
		# Until the whole array is a heap
		until heap_size >= arr.length
			# Position of the next element to be put in the heap
			pos = heap_size
			# Position of the parent
			parent = pos / 2
			# Until the num at [pos] is either the top element or a bigger parent is found
			until pos == 1 || arr[pos] < arr[parent]
				# Swap with parent if in wrong order
				swapper = arr[pos]
				arr[pos] = arr[parent]
				arr[parent] = swapper
				# Calculate the next position of the element and the next parent
				pos /= 2
				parent = pos / 2
			end
			# Increase the heap size
			heap_size += 1
		end
		arr
	end

end
