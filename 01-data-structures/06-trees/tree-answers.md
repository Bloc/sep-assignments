# Questions about Trees

## How much time does an average insertion consume in the Binary Search Tree compared to the Heap?

For my simple tests, the binary search tree took an average of about .45 milliseconds per insertion (4.5 seconds for 10,000 insertions).
In contrast, the heap took an average of .20 milliseconds. So the heap was over 20 times as fast. Part of the reason that the heap was so
much faster was because it was built on top of Ruby arrays, which have already been optimized. So it might not be a fair comparison. The method for
inserting was very different for the heap, because you always insert at the end of the underlying array, which is very quick. But then there is a
"bubbling process" to get the inserted item into position. That will take a number of steps equal to the depth, which grows much slower than the number
of elements.

In contrast, the insertion for the binary search tree requires searching for the exact right spot to place the item, which could involve many comparisons.

## How much time does finding 50000 in the Binary Search Tree consume compared to the Heap?

I ended up using only 10,000 nodes, rather than 100,000, because 100,000 was beyond what my implementation could handle. So I searched for item 5000.

The heap required only about 0.3 milliseconds. The binary search tree required 0.8 milliseconds. So the heap was still faster, but it wasn't anywhere
near as bad as with insertion.

## How much time does the average deletion consume in a Binary Search Tree compared to the Heap?
The heap required 0.1 milliseconds, while the binary tree required 0.7. So the ratio is about the same as for find. In the binary search tree, deletion is only a couple
of extra pointer manipulations different than finding the item, so it makes sense that the times would be similar.

## When would you use a Binary Search Tree and why?

The tests that I performed didn't actually show my binary search being better at anything, but that's probably an artifact of Ruby's optimized arrays, which
were used for the heap, but not the binary search tree. However, my experiments did show that the binary search tree did not do as badly at "find". So my guess
would be that if you are storing lots of items, and it was important to find an arbitrary item quickly, then the binary search tree should be considered.

## When would you use an Heap and why?

The heap is organized so that it's really quick to find the item with the maximum value (or minimum, depending on the type of heap). So if you're mostly interested in
finding the maximum or minimum item, then a heap should be used. The organization doesn't help a lot if you're search for an item that isn't a max or min.

