class Matrix

	attr_reader :m, :n

	def initialize m, n
		@m = m
		@n = n
		@matrix = Array.new(@m) { Array.new(@n) { block_given? ? yield : nil } }
	end

	def swap_rows m0, m1
		raise "Row out of range! Must be <0; #{@m - 1}>" if 0 > m0 or m0 >= @m or 0 > m1 or m1 >= @m
		tmp = @matrix[m0]
		@matrix[m0] = @matrix[m1]
		@matrix[m1] = tmp
	end

	def swap_cols n0, n1
		raise "Column out of range! Must be <0; #{@n - 1}>" if 0 > n0 or n0 >= @n or 0 > n1 or n1 >= @n
		@matrix.length.times do |i|
			tmp = @matrix[i][n0]
			@matrix[i][n0] = @matrix[i][n1]
			@matrix[i][n1] = tmp
		end
	end

	def get i, j
		@matrix[i][j]
	end

	def set i, j, val
		@matrix[i][j] = val
	end

	def operation mat, target = self
		raise "Matrices have to be of the same size!" if mat.m != @m or mat.n != @n
		target.m.times do |i|
			target.n.times do |j|
				target.set i, j, yield(target,get(i, j), mat.get(i, j))
			end
		end
	end

	def add mat, a = 1, b = 1
		self.operation(mat) { |old, new| (a * old) + (b * new) }
	end

	def subtract mat, a = 1, b = 1
		self.operation(mat) { |old, new| (a * old) - (b * new) }
	end

	def multiply mat, a = 1, b = 1
		self.operation(mat) { |old, new| (a * old) * (b * new) }
	end

	def divide mat, a = 1, b = 1
		self.operation(mat) { |old, new| (a * old) * (b * new) }
	end

	def modulo mat, a = 1, b = 1
		self.operation(mat) { |old, new| (a * old) % (b * new) }
	end

	# Aliases
	alias :'+' :add
	alias :'-' :subtract
	alias :'*' :multiply
	alias :'/' :divide
	alias :'%' :modulo

end
