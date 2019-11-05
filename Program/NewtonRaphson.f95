module NewtonRaphson
  use fx; use dfx
  implicit none
  integer, public :: cycles_Newton_Raphson
  double precision, public :: initial_guess_newton_raphson, answer_newton_raphson
  double precision, protected :: dx_answer_newton_raphson
  real, public :: tolerance_Newton_Raphson
  public :: calculate_newton_raphson

  interface
    module function calculate_newton_raphson()
      integer:: calculate_newton_raphson
    end function calculate_newton_raphson
  end interface
end module NewtonRaphson

submodule (NewtonRaphson) output_process
contains
  module function calculate_newton_raphson()
    in = initial_guess_newton_raphson
    answer_newton_raphson = evaluate_fx()
    in_dfx = initial_guess_newton_raphson
    dx_answer_newton_raphson = evaluate_dfx()

    do i = 1, cycles_Newton_Raphson, 1
      if ( ABS(answer_newton_raphson)<tolerance_Newton_Raphson ) then
        exit
      else
        in = initial_guess_newton_raphson
        answer_newton_raphson = evaluate_fx()
        in_dfx = initial_guess_newton_raphson
        dx_answer_newton_raphson = evaluate_dfx()
        initial_guess_newton_raphson = initial_guess_newton_raphson-(answer_newton_raphson/dx_answer_newton_raphson)
      end if
    end do
    calculate_newton_raphson = i
  end function calculate_newton_raphson
end submodule
