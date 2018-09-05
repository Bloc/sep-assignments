Explain why doubling the size of the underlying array of your HashClass may be a poor idea.

Even though it's a linear increase, you're still having to store double of what you potentially need in the best case it's a n+1 situation. In the case of the Lord of the Rings test spec, it had an extra 18 nils.

If there is a count of 6 actual hashes while being in an array of 24 making a 75% (by count) waste of memory holding nil values. It would be about ~184 bytes worth of just nil that grows also at a linear increase. And, if you have an array of 24 nils it would be 232 bytes vs 136 bytes with 12 nils [1]

Outside of the increasing size, there is fragmentation which isn't exactly an issue due to the internal `index` method until you have to `resize` via a loop over the array meaning that in the case of the Lord of the Rings, if we had to `resize` again to 48, then we would be looping over 17 nils til the final record and then the remaining unless there was a break. This could be potentially mitigatied at a minor level if there was also an internal increment of the hashes stored working to integrate a break but isn't a great solution to the overall problem.

[1] Graph Below:
```
require 'objspace'
(1..24).to_a.each { |i| p [nil] * i, ObjectSpace.memsize_of([nil] * i) }
```

```
[nil]
40
[nil, nil]
40
[nil, nil, nil]
40
[nil, nil, nil, nil]
72
[nil, nil, nil, nil, nil]
80
[nil, nil, nil, nil, nil, nil]
88
[nil, nil, nil, nil, nil, nil, nil]
96
[nil, nil, nil, nil, nil, nil, nil, nil]
104
[nil, nil, nil, nil, nil, nil, nil, nil, nil]
112
[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
120
[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
128
[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
136
[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
144
[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
152
[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
160
[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
168
[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
176
[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
184
[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
192
[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
200
[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
208
[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
216
[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
224
[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
232
```