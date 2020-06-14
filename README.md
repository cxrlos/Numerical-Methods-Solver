<!------------------------------------------------- README ---------------
    |
    |   Developers:  
    |       Carlos García - https://github.com/cxrlos
    |       Yann Le Lorier - https://github.com/yannlelorier
    |
    *-------------------------------------------------------------------->

# Circle spiral and fractal drawing using Racket 

![Demo](Demo.gif)

## 1. Authors

[Carlos García](https://github.com/cxrlos)\
[Yann Le Lorier](https://github.com/yannlelorier)

## 2. Context

TBD

## 3. Project Description

### 3. 1 Spiral 

TBD

### 3. 2 Fractal 

## 4. Topics

1. **Pointers**
    - To store the graph information in interconnected objects
2. **Threads**
   - Graph creation
4. **Signals**
    - To correctly pause or stop the simulation.
5. **Dynamic Memory**
    - To store the graph information in an vector

## 5. Use Cases

The programs serves the pupose of being a close representation of a virus outburst in a static network environment. It is quite useful because it allows for different snapshots to be analyzed at different points in time.

## 6. Dependencies

- C++ environment (gpp 2.0+)
- [SFML library](https://www.sfml-dev.org/tutorials/2.5/start-linux.php)
- cmake (3.1 minimum)

## 7. Running the program

Read the [TemplateInstructions](https://github.com/yannlelorier/Covid-19-tracker-simulator/blob/master/TemplateInstructions.txt) file to modify the [Nodes](https://github.com/yannlelorier/Covid-19-tracker-simulator/blob/master/Nodes.txt) file to your liking.

~~~sh
mkdir build && cd build
cmake ..
make
./program-name -i <inputFilename>
~~~

## References

[Stochastic simulations of Epidemics](https://link.springer.com/content/pdf/bbm%3A978-3-319-50806-1%2F1.pdf), I.Z. Kiss et al., *Mathematics of Epidemics on Networks*, Interdisciplinary Applied
Mathematics 46, DOI 10.1007/978-3-319-50806-1
