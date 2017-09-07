# Questions about Linked Lists

## Q1. What is Spatial Locality and why does it benefit performance?
Spatial locality is when related elements are physically close together in memory. 
For example, in an array, all the elements of the array are next to each other.
This makes several operations on data structures fast:
* Fetching all data associated with a data structure can be done at once, without
a lot of searching or following pointers.
* Navigating (such as going to the previous element or next element) is trivial.

## Q2. Compare the performance of an Array to a Linked List using the Benchmark module.

### Q2.1 Compare the time it takes to create a 10,000 item Array to appending 10,000 items to a Linked List.
As tested in the file `01-data-structures/03-linked-lists/array_test.rb`, the
results are:

```
#  Output
#  
#                        user     system      total        real
# create array:        0.000000   0.000000   0.000000 (  0.000046)
# create linked-list:  0.010000   0.000000   0.010000 (  0.004889)
```
Creating a 10000 item linked list takes 100 times as long

### Q2.2 Compare the time it takes to access the 5000th element of the Array and the 5000th Node in the Linked List.

```
# Output
#                                    user     system      total        real
# access element in array:        0.000000   0.000000   0.000000 (  0.000001)
# access element in linked-list:  0.000000   0.000000   0.000000 (  0.000263)
```
Accessing the 5000th element takes over 200 times as long for linked lists than for arrays.


### Q2.3 Compare the time it takes to remove the 5000th element from the Array to removing the 5000th Node in the Linked List.
```
# Output
#                                     user     system      total        real
# remove element in array:        0.000000   0.000000   0.000000 (  0.000007)
# remove element in linked-list:  0.000000   0.000000   0.000000 (  0.109955)
```

Hmm. This one seems unbelievable. It seems to say that removing the 5000th element is 10,000 times slower with linked lists.
That's surprising, since it's only necessary to change a couple of `next` pointers. There might be something weird with my
implementation.