require 'benchmark'
require './search_algos.rb'

ITERS = 10**(ARGV[0].to_i)

puts (SearchAlgos.simple_text_search "ahojjaksemas", "jakse")
puts (SearchAlgos.simple_text_search "ahojemas", "ahoj")
puts (SearchAlgos.simple_text_search "ahojemas", "emas")
puts (SearchAlgos.simple_text_search "lolow", "low")

Benchmark.bm do |bm|

	bm.report do
		ITERS.times do
			SearchAlgos.simple_text_search "hello how are you", "how"
		end
	end

	bm.report do
		ITERS.times do
			puts SearchAlgos.simple_text_search("hello hhow are you", "how")
		end
	end

end

