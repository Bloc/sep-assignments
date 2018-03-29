require 'benchmark'
require_relative 'improving_complexity_version_one'
require_relative 'improving_complexity_version_two'
require_relative 'improving_complexity_version_three'
require_relative 'improving_complexity_version_four'

Benchmark.bm(7) do |x|
  x.report("improvement_one: ") { improvement_one([19,18,17,20], [4,2,3,1], [9,12,11,10], [5,6,7,8], [16,13,14,15], [21,23,22,25,24]) }
  x.report("improvement_two: ") { improvement_two([19,18,17,20], [4,2,3,1], [9,12,11,10], [5,6,7,8], [16,13,14,15], [21,23,22,25,24]) }
  x.report("improvement_three: ") { improvement_three([19,18,17,20], [4,2,3,1], [9,12,11,10], [5,6,7,8], [16,13,14,15], [21,23,22,25,24]) }
  x.report("improvement_four: ") { improvement_four([19,18,17,20], [4,2,3,1], [9,12,11,10], [5,6,7,8], [16,13,14,15], [21,23,22,25,24]) }
end
puts "\n"

# Results from ruby benchmark.rb
#                       user     system      total        real
#improvement_one:     0.000000   0.000000   0.000000 (  0.000036)
#improvement_two:     0.000000   0.000000   0.000000 (  0.000090)
#improvement_three:   0.000000   0.000000   0.000000 (  0.000008)
#improvement_four:    0.000000   0.000000   0.000000 (  0.000011)
