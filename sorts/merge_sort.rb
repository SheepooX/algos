class MergeSort

	def self.sort arr
		orig_len = arr.length
		ideal_len = nearest_higher_power arr.length
		(ideal_len - arr.length).times do
			arr.push nil
		end
		sub_size = 1
		# For every merging level
		while sub_size < arr.length
			new_arr = Array.new arr.length
			i = 0
			seg = 0
			while seg < arr.length / sub_size
				left = seg * sub_size
				right = (seg + 1) * sub_size
				left_start = left
				right_start = right
				right_stop = (seg + 2) * sub_size
				while left < right_start and right < right_stop and left < arr.length and
						right < arr.length
					if arr[right].nil? or (arr[left] < arr[right])
						new_arr[i] = arr[left]
						left += 1
					else
						new_arr[i] = arr[right]
						right += 1
					end
					i += 1
				end
				if left >= right_start
					while right < right_stop
						new_arr[i] = arr[right]
						i += 1
						right += 1
					end
				elsif right >= right_stop
					while left < right_start
						new_arr[i] = arr[left]
						i += 1
						left += 1
					end
				end
				seg += 2
			end
			arr = new_arr
			sub_size *= 2
		end
		return arr[0, orig_len]
	end

	# private

	def self.nearest_higher_power len
		power = 1
		while true
			break if (power >= len and len & power == 0) or power == len
			power *= 2
		end
		return power
	end

	def self.merge left, right
		arr = Array.new left.length + right.length
		l_i = 0
		r_i = 0
		i = 0
		while i < arr.length
			if left[l_i].nil?
				arr[i] = right[r_i]
				r_i += 1
			elsif right[r_i].nil?
				arr[i] = left[l_i]
				l_i += 1
			else
				if left[l_i] < right[r_i]
					arr[i] = left[l_i]
					l_i += 1
				else
					arr[i] = right[r_i]
					r_i += 1
				end
			end
			i += 1
		end
		return arr
	end

end
