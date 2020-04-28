# FORTRAN Numerical Methods Solver

## Run
Go to the Program folder and type in the following commands:

`gfortran dfx.f95 fx.f95 Secant.f95 Bisection.f95 FalsePosition.f95 fxfy.f95  NewtonRaphson.f95 Main.f95 -o NMSolver`\
`rm *.mod *.smod`\
`./NMSolver`

## Methods Included

### Non-Linear Equations

- [X] Bisection
- [X] False Position
- [X] Newton-Raphson (Tangent)
- [X] Secant

### System of Linear Equations

- [ ] Gaussian Elimination
- [ ] LU Decomposition
- [ ] Gauss-Seidel

### Numerical Interpolation

- [ ] Lagrange
- [ ] Power Series
- [ ] Newton Divided Differences

### Regression

- [ ] Polynomial
- [ ] Exponential
- [ ] Logarithmic

### Numerical Integration

- [ ] Trapezoidal
- [ ] Simpson ⅓
- [ ] Simpson ⅜

### Differential Equations

- [ ] Euler
- [ ] Modified Euler
- [ ] Runge Kutta 3
- [ ] Runge Kutta 4
