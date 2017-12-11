require 'benchmark'
require './sorts/bubble_sort.rb'

ITERS = 10 ** 6

Benchmark.bm do |bm|

	bm.report "NEW" do
		ITERS.times do
			BubbleSort.sort2 [9, 8, 7, 6, 5, 4, 3, 1, 0, -1, -3, -4, -5, -6]
		end
	end

	bm.report do
		ITERS.times do
			BubbleSort.sort [9, 8, 7, 6, 5, 4, 3, 1, 0, -1, -3, -4, -5, -6]
		end
	end

end
