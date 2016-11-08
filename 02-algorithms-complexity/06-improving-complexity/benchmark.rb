require 'benchmark'
require_relative './poorly_written_ruby'
require_relative './improving_complexity_version_one'
require_relative './improving_complexity_version_two'
require_relative './improving_complexity_version_two_rs'
require_relative './improving_complexity_version_three'

array1 = []
array2 = []
array3 = []

1000.times do |x|
  array1 << rand(1000)
  array2 << rand(1000)
  array3 << rand(1000)
end

Benchmark.bm(25) do |x|
  x.report('poorly_written_ruby:')  {poorly_written_ruby(array1, array2, array3)}
  x.report('code optimization:')  {code_optimized_ruby(array1, array2, array3)}
  x.report('time complexity:')    {time_optimized_ruby(array1, array2, array3)}
  x.report('ruby sort')           {time_optimized_ruby_rs(array1, array2, array3)}
  x.report('space complexity')    {space_optimized_ruby(array1, array2, array3)}
end
