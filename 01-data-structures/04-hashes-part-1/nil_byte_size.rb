require 'objspace'
(1..24).to_a.each { |i| [nil] * i; p ObjectSpace.memsize_of([nil] * i) }