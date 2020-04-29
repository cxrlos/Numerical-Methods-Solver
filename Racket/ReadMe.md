# Racket Numerical Methods Solver

## Run

Edit the [fx.txt](https://github.com/cxrlos/Numerical-Methods-Solver/tree/master/Racket/fx.txt) and [fy.txt](https://github.com/cxrlos/Numerical-Methods-Solver/tree/master/Racket/fy.txt) files to input the desired functions (syntax inside the text description). Then, in the command line or terminal, input the following commands:

`racket`\
`(enter! "NMSolver.rkt")`

Then, to select a method you will have to input specific commands that will be on the corresponding method description below.

## Methods Included

### Non-Linear Equations

Run: `(non-linear x)`

- [ ] Secant Method

Although closed methods such as bisection or false position are quite simpler to implement, these tend to be less optimal than the open methods and they have to receive two values to calculate the estimate. The main difference between this method and other closed methods is the lack of derivative calculations that are a bit more complex to implement.

### Numerical Interpolation

Run: `(interpolation x)`

- [ ] Newton Divided Differences

Explain

### Numerical Integration

Run: `(integration x)`

- [ ] Simpson ![equation](http://www.sciweavers.org/upload/Tex2Img_1588201210/render.png)

Explain

### Differential Equations

Run: `(differential x)`

- [ ] Modified Euler

Explain