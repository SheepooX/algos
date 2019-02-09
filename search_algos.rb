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

    # This apparently does not work
	def self.simple_text_search haystack, needle
		i = 0
		j = 0
		# Until the i is out of bounds or the fragment is found
		while i < haystack.length and j < needle.length
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
			if haystack[i] != needle[j]
				i -= 1
				j = -1
			end
			i += 1
			j += 1
		end
		j == needle.length ? true : false
	end

    # Returns the ranges where needle is located in haystack
    def self.kmp haystack, needle
      fail_func = Array.new(needle.length, 0)

      step = -> (i, char) {
        if i < needle.length and needle[i] == char
          return i + 1
        elsif i > 0
          return step.call(fail_func[i - 1], char)
        else
          return 0
        end
      }

      # Construct an array that tells us where to return in needle
      # when haystack does not match
      (1...needle.length).each do |i|
        fail_func[i] = step.call(fail_func[i - 1], needle[i])
      end
      puts fail_func.to_s

      # Find needle in haystack
      state = 0
      answers = Array.new()
      (0...haystack.length).each do |i|
        state = step.call(state, haystack[i])
        if state == needle.length
          answers << [i - needle.length + 1, i]
        end
      end
      return answers
    end

end

