1.  O(n^2)
    - Initial array building is n - 1, ignored as n approached infinty
    - Iterative portion is O(n^2)

2. O(n^2)
    - Initial array building same as #1
    - Replaced iterative w/ quicksort which is O(n^2)

3. O(n)
   - O(1) for building the linked list as we are inserting at the end as we build
   - Searching linked list for next smallest value and adding to end of array is O(n)


# Benchmark comparison of each optimization

                            user       system     total       real
poorly_written_ruby:        0.180000   0.010000   0.190000    (0.187242)
code optimization:          0.120000   0.000000   0.120000    (0.122799)
time complexity:            0.010000   0.000000   0.010000    (0.007072)
ruby sort                   0.000000   0.000000   0.000000    (0.000422)
space complexity            0.620000   0.010000   0.630000    (0.640926)

# 1000.times do |x|
#   array1 << rand(1000)
#   array2 << rand(1000)
#   array3 << rand(1000)
# end
