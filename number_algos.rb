class NumberAlgos

	# Greatest common divisor, euclidean algorithm
	def self.gcd x, y
		# Subtract the two numbers from each other until one of them is < 1
		while x > 0 and y > 0
			if x > y
				x %= y
			else
				y %= x
			end
		end
		# Return the not 0 var
		x == 0 ? y : x
	end

	# Least common multiple
	def self.lcm x, y
		(x * y) / gcd(x, y)
	end

	# n * (n - 1) * (n - 2) * ... * 1
	def self.factorial n
		f = 1
		while n > 1
			f *= n
			n -= 1
		end
		f
	end

	# Polynomial calculation
	# pol = [-3, 0, 2, -2] 			=
	# = -3*x^3 + 0*x^2 + 2*x - 2 	=
	# = x * (-3*x^2 + 0*x + 2) -2 	=
	# = x * (x * (-3x + 0) + 2) - 2
	def self.horners_method pol, x
		h = pol[0]
		i = 1
		while i < pol.length
			h = h * x + pol[i]
			i += 1
		end
		h
	end

	# str is a string eg. base 3: "120211"
	# 'a' and 'A' are evaluated the same
	def self.to_10_base str, base
		# Conversion from str to number
		# Array of the same length
		num = Array.new str.length
		# Split into letters
		str.split('').each_index do |i|
			# Evaluate the letters
			val = str[i].ord
			# Numbers 0 = 48, 9 = 57
			val -= 48 if 47 < val and val < 58
			# Upcase letters A = 65, Z = 90
			val -= 55 if 64 < val and val < 91
			# Lowercase letters a = 97, z = 122
			val -= 87 if 96 < val and val < 123
			num[i] = val
		end
		# User Horner's method
		NumberAlgos.horners_method num, base
	end

	# Convert from 10-base to n-base
	def self.from_10_base num, base
		# Output
		arr = []
		# Until the division has reached 1
		until num == 1
			# Get the remainder
			val = num % base
			# For 0-9 to '0'-'9'
			val += 48 if val < 10
			# For 10-35 to 'A'-'Z'
			val += 55 if val < 35
			arr.push val.chr
			# Divide the num
			num /= base
		end
		# Reverse and create a string
		arr.reverse.join
	end

end
