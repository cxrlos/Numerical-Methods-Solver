# Racket Numerical Methods Solver

## Run

*USER HAS TO EDIT TXT FILES WITH DATA, DETERMINE FORMAT FOR USER TO PLUG-IN VALUES*\
Edit the [fx.txt](https://github.com/cxrlos/Numerical-Methods-Solver/tree/master/Racket/fx.txt) and [fy.txt](https://github.com/cxrlos/Numerical-Methods-Solver/tree/master/Racket/fy.txt) files to input the desired functions (syntax inside the text description). Then, in the command line or terminal, input the following commands:

`racket`\
`(enter! "NMSolver.rkt")`

Then, to select a method you will have to input specific commands that will be on the corresponding method description below.

## Methods Included

### Non-Linear Equations

Run: `(non-linear x)`

- [ ] Secant Method

Although closed methods such as bisection or false position are quite simpler to implement, these tend to be less optimal than the open methods and they have to receive two values to calculate the estimate. The main difference between this method and other closed methods is the lack of derivative calculations that are a bit more complex to implement.

### Numerical Integration

Run: `(integration x)`

- [ ] Simpson ⅜

There are other methods that are quite simple derived from the Newton-Cotes method. These are fairly simple algorithms to develop but tend to be less precise per cycle than Simpson based methods. The selection of ⅜ instead of ⅓ is also related to precision terms.

### Differential Equations

Run: `(differential x)`

- [ ] Euler

Due to the complex nature of differential equations calculations, Euler's method will be the function to implement due to it's acceptable precision and easy-to-implement nature.