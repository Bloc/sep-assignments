# Written Assignment: Checkpoint-5

## Describe three collision resolution strategies not mentioned here.

### Array Hash Table

An array hash table is a variant of Separate Chaining, where a dynamic array is
used instead of a linked list to store all the items that hash to the same index.


### Dynamic Perfect Hashing

This is another variant of Separate Chaining, where a second hashtable is used to
store those items that have the same index according to the first hash table. The
second-level hashtable is constructed so that it is guaranteed not to have collisions
(that is, no two distinct keys get hashed to the same index). I actually do not
understand how it is possible to guarantee this.

### Self-balancing binary search trees

With this approach, a binary search tree is used to store the elements within a
bucket. The way that a binary search tree works is that each element is placed 
in a tree structure. There is a root node, and each node is either a terminal node
or has one or two child nodes. To search for an element, you start at the root
node and at each node, you either take the right branch or the left branch,
depending on the value of the element you're searching for. A self-balancing
tree attempts to keep approximately equal numbers of elements in both of the
branches, which minimizes search time.

## Create your own collision resolution strategy and describe how it works.

### Parallel Hashing

Here's another way that I thought of for using two hash tables simultaneously.
At any given time, there are two hash tables, one twice the size of the other.
When inserting an element, you first compute the index into the smaller table.
If there is a collision, then you switch to using the larger table. If there is
also a collision with the larger table, then quadruple the size of the smaller
table (thus making it the new larger table). The elements of the old small table
are stuck into the new large table.

This approach has the property that it's not necessary to rehash the entire
table, but only a subset.
