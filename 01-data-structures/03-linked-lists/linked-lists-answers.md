#### What is Spatial Locality and why does it benefit performance?

It's when you access or manipualte an item in memory which is "near" another item, so you're able to predict size and location. So, in the case of an Array:

I might have `array[5000]` I know that `array[0..4999]` exists inside that array in some form. So, if I'm working with the array it makes more sense to cache the entire array instead of cacheing each index of the array.

#### Compare the performance of an Array to a Linked List using the Benchmark module.

```
10k Array vs LinkedList
       user     system      total        real
LinkedList:  3.260000   0.000000   3.260000 (  3.265711)
Array:       0.000000   0.000000   0.000000 (  0.004884)

Access 5000th in Array vs Linklist
       user     system      total        real
LinkedList:Select
0..5000
  0.000000   0.000000   0.000000 (  0.000680)
Array:     Select
  0.000000   0.000000   0.000000 (  0.000015)

Remove 5000th in Array vs Linklist
       user     system      total        real
LinkedList:  0.000000   0.000000   0.000000 (  0.000338)
Array:       0.000000   0.000000   0.000000 (  0.000009)
```