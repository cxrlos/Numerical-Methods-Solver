!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Author: Carlos García (cxrlos)                                               !
!                                                                              !
! Description: FORTRAN Program designed to solve diffferent types of mathema-  !
! tical problems. All of the algorithms for the code have been developed but   !
! modular implementation is desired for the project.                           !
!                                                                              !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

program Main

  use Bisection; use FalsePosition; use NewtonRaphson; use Secant
  use fx; use fxfy
  implicit none
  integer :: menuInputA,menuInputB, c, cycles
  double precision :: tolerance, inputA, inputB

  print*, char(7) !Sound
  print*, achar(27)//"[2J" !Terminal spacing
  print*, " __      __        __                               "
  print*, "/  \    /  \ ____ |  |   ____  ____   _____   ____  "
  print*, "\   \/\/   // __ \|  | _/ ___\/  _ \ /     \_/ __ \ "
  print*, " \        /\  ___/|  |_\  \__(  <_> )  Y Y  \  ___/"
  print*, "  \__/\__/  \_____>____/\_____>____/|__|_|__/\_____>"
  print*,
  print*,
  print*,
  print*,
  print*,
  print*,
  print*,
  print*,
  print*, "Welcome to the system, please input the maximum number of cycles for your computer to run:"
  read(*,*)cycles
  cycles_Bisection = cycles; cycles_False_Position = cycles; cycles_Newton_Raphson = cycles
  cycles_Secant = cycles
  print*,
  print*, "Now please set the value for the tolerance in decimals:"
  read(*,*)tolerance
  tolerance_Bisection = tolerance; tolerance_False_Position = tolerance; tolerance_Newton_Raphson = tolerance
  tolerance_Secant = tolerance
  print*,
  do while ( menuInputA /= 9 )
    print*, "Numerical Methods System, please select one of the following operations:"
    print*, "------------------------------------------------------------------------"
    print*, "1. Non-Linear Equations"
    print*, "2. System of Linear Equations"
    print*, "3. Numerical Interpolation"
    print*, "4. Regression"
    print*, "5. Numerical Integration"
    print*, "6. Differential Equations"
    print*, "7. Change Maximum Number of Cycles"
    print*, "8. Change tolerance Value"
    print*, "9. Exit"
    read (*,*) menuInputA
    menuInputB = 1
    print*,
    print*,
    do while ( menuInputB /= 0 )
      select case (menuInputA)
      case(1) !Non linear equations
        print*, "Please select a method to approximate a solution for the function:"
        print*, "------------------------------------------------------------------"
        print*, "1. Bisection"
        print*, "2. False Position"
        print*, "3. Newton-Raphson (Tangent)"
        print*, "4. Secant"
        print*, "0. Back"
        read (*,*) menuInputB
        select case (menuInputB)
        case(1)
          print*, achar(27)//"[2J"
          print*, "Bisection:"
          print*,"Enter the x value for the left and right hand points respectively:"
          read (*,*) inputA,inputB
          pointA_Bisection = inputA; pointB_Bisection = inputB
          c = calculate_bisection()
          print*, "The approximated y value is ", resC_Bisection, "using  ", pointC_Bisection, "in ", c-1, "cycles,"
          print*,"the absolute error is ",ABS(resC_Bisection), "The tolerance used was set to ",tolerance,"."
          print*,
        case(2)
          print*, achar(27)//"[2J"
          print*, "False Position:"
          print*,"Enter the x value for the left and right hand points respectively:"
          read (*,*) inputA,inputB
          pointA_False_Position = inputA; pointB_False_Position = inputB
          c = calculate_false_position()
          print*, "The approximated y value is ", resC_False_Position, "using  ", pointC_False_Position, "in ", c-1, "cycles."
          print*,"the absolute error is ",ABS(resC_False_Position), "The tolerance used was set to ",tolerance,"."
          print*,
        case(3)
          print*, achar(27)//"[2J"
          print*, "Newton-Raphson:"
          print*,"Enter the x value for the initial guess:"
          read (*,*) inputA
          initial_guess_newton_raphson = inputA
          c = calculate_newton_raphson()
          print*, "The approximated y value is ", answer_newton_raphson, "using  ", initial_guess_newton_raphson
          print*, "in ", c-1, "cycles, the absolute error is",ABS(answer_newton_raphson),"."
          print*, "The tolerance used was set to ",tolerance,"."
          print*,
        case(4)
          print*, achar(27)//"[2J"
          print*, "Secant:"
          print*,"Enter the x value for the initial guess:"
          read (*,*) inputA
          initial_guess_secant = inputA
          c = calculate_secant()
          print*, "The approximated y value is ", resC_Secant, "using  ", pointC_Secant,"in ", c-1, "cycles."
          print*,"the absolute error is ",ABS(resC_Secant), "The tolerance used was set to ",tolerance,"."
          print*,
        case(0)
          print*, achar(27)//"[2J"
        case default
          print*, achar(27)//"[2J"
          print*, "That index does not exist in the menu, please re-type your input."
          print*,
        end select
      case(2) !System of linear equations
        print*, "Please select a method to generate a System of Linear Equations:"
        print*, "----------------------------------------------------------------"
        print*, "1. Gaussian Elimination"
        print*, "2. LU Decomposition"
        print*, "3. Gauss-Seidel"
        print*, "0. Back"
        read (*,*) menuInputB
        select case (menuInputB)
        case(1)
          print*, achar(27)//"[2J"
          print*, "Gaussian Elimination:"
          print*,
        case(2)
          print*, achar(27)//"[2J"
          print*, "LU Decomposition:"
          print*,
        case(3)
          print*, achar(27)//"[2J"
          print*, "Gauss-Seidel:"
          print*,
        case(0)
          print*, achar(27)//"[2J"
        case default
          print*, achar(27)//"[2J"
          print*, "That index does not exist in the menu, please re-type your input."
          print*,
        end select
      case(3) !Interpolation
        print*, "Please select a method for Numerical Interpolation:"
        print*, "---------------------------------------------------"
        print*, "1. Lagrange Polynomial"
        print*, "2. Power Series"
        print*, "3. Newton Divided Differences"
        print*, "0. Back"
        read (*,*) menuInputB
        select case (menuInputB)
        case(1)
          print*, achar(27)//"[2J"
          print*, "Lagrange Polynomial:"
          print*,
        case(2)
          print*, achar(27)//"[2J"
          print*, "Power Series:"
          print*,
        case(3)
          print*, achar(27)//"[2J"
          print*, "Newton Divided Differences:"
          print*,
        case(0)
          print*, achar(27)//"[2J"
        case default
          print*, achar(27)//"[2J"
          print*, "That index does not exist in the menu, please re-type your input."
          print*,
        end select
      case(4) !Regression
        print*, "Please select a method for Regression:"
        print*, "--------------------------------------"
        print*, "1. Polynomial"
        print*, "2. Exponential"
        print*, "3. Logarithmic"
        print*, "0. Back"
        read (*,*) menuInputB
        select case (menuInputB)
        case(1)
          print*, achar(27)//"[2J"
          print*, "Polynomial:"
          print*,
        case(2)
          print*, achar(27)//"[2J"
          print*, "Exponential:"
          print*,
        case(3)
          print*, achar(27)//"[2J"
          print*, "Logarithmic:"
          print*,
        case(0)
          print*, achar(27)//"[2J"
        case default
          print*, achar(27)//"[2J"
          print*, "That index does not exist in the menu, please re-type your input."
          print*,
        end select
      case(5) !Integration
        print*, "Please select a method for Integration:"
        print*, "---------------------------------------"
        print*, "1. Trapezoidal Rule"
        print*, "2. Simpson ⅓"
        print*, "3. Simpson ⅜"
        print*, "0. Back"
        read (*,*) menuInputB
        select case (menuInputB)
        case(1)
          print*, achar(27)//"[2J"
          print*, "Trapezoidal:"
          print*,
        case(2)
          print*, achar(27)//"[2J"
          print*, "Simpson ⅓:"
          print*,
        case(3)
          print*, achar(27)//"[2J"
          print*, "Simpson ⅜:"
          print*,
        case(0)
          print*, achar(27)//"[2J"
        case default
          print*, achar(27)//"[2J"
          print*, "That index does not exist in the menu, please re-type your input."
          print*,
        end select
      case(6) !Differential equations MISSING
        print*, "Please select a method to solve Differential Equations:"
        print*, "-------------------------------------------------------"
        print*, "1. Euler"
        print*, "2. Modified Euler"
        print*, "3. Runge Kutta 3"
        print*, "4. Runge Kutta 4"
        print*, "0. Back"
        read (*,*) menuInputB
        select case (menuInputB)
        case(1)
          print*, achar(27)//"[2J"
          print*, "Euler:"
          print*,
        case(2)
          print*, achar(27)//"[2J"
          print*, "Modified Euler:"
          print*,
        case(3)
          print*, achar(27)//"[2J"
          print*, "Runge Kutta 3:"
          print*,
        case(4)
          print*, achar(27)//"[2J"
          print*, "Runge Kutta 4:"
          print*,
        case(0)
          print*, achar(27)//"[2J"
        case default
          print*, achar(27)//"[2J"
          print*, "That index does not exist in the menu, please re-type your input."
          print*,
        end select
      case(7) !Cycles
        print*, "Please input the maximum number of cycles for your computer to run:"
        read(*,*)cycles
        cycles_Bisection = cycles; cycles_False_Position = cycles; cycles_Newton_Raphson = cycles
        cycles_Secant = cycles
        menuInputB = 0
        print*,
      case(8) !Tollerance
        print*, "Please set the value for the tolerance in decimals:"
        read(*,*)tolerance
        tolerance_Bisection = tolerance; tolerance_False_Position = tolerance; tolerance_Newton_Raphson = tolerance
        tolerance_Secant = tolerance
        menuInputB = 0
        print*,
      case(9) !End
        print*, "Thank you for using the system!"
        print*,
        print*,
        print*,
        print*, "__________                   /\  /\   "
        print*, "\______   \___ __  ____      \ \/ /   "
        print*, " |    |  _<   |  |/ __ \     /~~\/\/\ "
        print*, " |    |   \\___  \  ___/\    \ ~~\/\/ "
        print*, " |________//_____|\_____|     \    /  "
        print*,
        print*,
        print*,
        print*,
        menuInputB = 0
        print*,
      case default !Error
        print*, achar(27)//"[2J"
        print*, "That index does not exist in the menu, please re-type your input."
        menuInputB = 0
        print*,
      end select
    end do
  end do
end program Main
