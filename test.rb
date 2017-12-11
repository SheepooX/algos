require 'benchmark'
require './sorts/insertion_sort.rb'

ITERS = 10 ** 6

Benchmark.bm do |bm|

	# bm.report do
	# 	ITERS.times do
	# 		InsertionSort.sort_slower [9, 8, 7, 6, 5, 4, 3, 1, 0, -1, -3, -4, -5, -6]
	# 	end
	# end

	bm.report do
		ITERS.times do
			InsertionSort.sort [9, 8, 7, 6, 5, 4, 3, 1, 0, -1, -3, -4, -5, -6]
		end
	end

end
