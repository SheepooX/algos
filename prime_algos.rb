class PrimeAlgos

	# Returns prime factors of n
	def self.factors n
		# Factor output
		factors = []
		# Start with 2
		d = 2
		# While the number is not 1
		while n != 1
			# If n is divisible by d add d to the factors and divide n by it
			# else increase d
			if n % d == 0
				factors.push d
				n /= d
			elsif d == 2
				d += 1
			else
				d += 2
			end
		end
		factors
	end

	# Returns true if n is prime, false if composite
	def self.is_prime? n
		# 2 is prime
		return true if n == 2
		# Any multiple of 2 or num < 2 is not
		return false if n % 2 == 0 or n < 2
		# Check every odd number starting with 3
		d = 3
		# Until the square root of n
		while d * d <= n
			# Return false is n is divisible by d
			return false if n % d == 0
			d += 2
		end
		# True if the number is prime
		true
	end

	# Eratosthene's sieve for getting primes until a given max
	# Returns array of booleans, true if prime false if composite
	# Index corresponds to the number
	def self.prime_sieve max
		# Create array of size max + 1 for 0..max inclusive
		arr = Array.new(max + 1, true)
		# 0, 1 are not primes
		arr[0] = false
		arr[1] = false
		# Start with 2
		num = 2
		# While the num is worth checking
		while num * num <= arr.length
			# Is current num prime?
			if arr[num]
				# Remove non prime nums
				i = 2 * num
				while i < arr.length
					arr[i] = false
					i += num
				end
			end
			num += 1
		end
		arr
	end

end
