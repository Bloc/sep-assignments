**Binary Search Tree**
```
The Matrix: 87
Star Wars: Return of the Jedi: 80
Star Wars: A New Hope: 93
Pacific Rim: 72
Inception: 86
The Martian: 92
Star Wars: The Empire Strikes Back: 94
Braveheart: 78
The Shawshank Redemption: 91
Mad Max 2: The Road Warrior: 98
District 9: 90
```

**Min Binary Heap**
```
Pacific Rim: 72
Braveheart: 78
Star Wars: Return of the Jedi: 80
The Matrix: 87
District 9: 90
Star Wars: The Empire Strikes Back: 94
Inception: 86
Star Wars: A New Hope: 93
The Shawshank Redemption: 91
The Martian: 92
Mad Max 2: The Road Warrior: 98
```

**Benchmark**
```
                           user     system      total        real
tree insert            0.480000   0.000000   0.480000 (  0.488880)
heap insert            0.550000   0.010000   0.560000 (  0.563291)
tree find              0.000000   0.000000   0.000000 (  0.000027)
heap find              0.030000   0.000000   0.030000 (  0.027743)
tree delete            0.000000   0.000000   0.000000 (  0.000029)
heap delete            0.040000   0.000000   0.040000 (  0.032938)
```

**When would you use a Binary Search Tree and when would you use a Heap?**
A Binary Search Tree would be best used in situations which require a data structure which needs to be sorted and searched. A Heap would be best used in situations where speed and efficiency are a priority.