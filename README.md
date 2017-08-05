## 1. A line of people at an amusement park ride.

### Description of the functionality

* The line is composed of members, who can be represented as strings.
* There is a front to the line, as well as a back.
* When you enter the line, you are placed at the back.
* People may leave the line whenever they see fit and those behind them take their place.
* Use the line_spec.rb spec file and line.rb skeleton file to help create your class.

### Discussion of the data structure
There are a number of different ways that this could be implemented.

#### As an array of names
This functionality could be implemented as an array of names. There would be the 
following operations on this array:

1. "Push": Add a new name to the end of the array.
2. "Pop": Remove the name at the start of the array, and move all the elements forward one spot.
3. "Remove": Remove a name from the middle of the array, and move all later elements forward one spot.

#### As an array with `start` and `end` markers
A variant on the above would be to have two variables, `start` and `end` to record the starting and
ending indices of the line. This would make "popping" really quick: you just increment the `start`
variable, with no need to move any other elements. However, moving elements would still be
necessary when someone leaves the line from the middle. Also, there would need to be an additional
"cleanup" operation to keep the array from growing arbitrarily:

* "Cleanup": Move the list of elements so that the first one is at the beginning of the array, and delete the elements that are no longer on the list.
* "DetectMess": Detect whether there is a need for cleanup (maybe because of reaching some max number of wasted cells)

#### As a linked list
A very different approach is to have an object for each member, and have a `next_member` 
variable whose value is equal to the next object in the list. There would be one 
variable, `start` that holds the first object. Then each operation would only involve overwriting
the `next_member` and `start`.

## 2. Pixels on a computer screen.

### Description of the functionality

* A screen has a width and a height.
* A screen is composed of Pixels.
* A Pixel requires three color values: red, green, and blue.
* Pixel colors red, green, and blue values must be greater than zero and less than 255. If a value less than zero is specified, default to zero. If a value greater than 255 is specified, default to 255.
* Pixels also require a coordinate location: x and y, these are both integers.
* Use the screen_spec.rb spec file, pixel.rb and screen.rb skeleton files to help create your class.

### Discusion of the data structure

There are at least two different ways to implement this functionality

#### As an array of values

This approach would have a two-dimensional array, with the indices being the x 
and y locations. Each element of the array would contain a triple of numbers, the
red/green/blue value. No pixel at all would be represented by the triple (0,0,0)

#### As a set of points

This approach would use an array of objects, each of which would have 4 values:
x-coordinate, y-coordinate, red-value, blue-value, green-value. This is a more
compact representation if there are only a few pixels that are colored in. In 
lighting up a point, it would be necessary to first check if the point exists,
so that we don't have two different color values for the same point

#### Variant on the above

In either case, there could be a default background color, so that an unspecified
pixel would have the color of the default.

