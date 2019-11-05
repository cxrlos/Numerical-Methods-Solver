module Secant
  use fx
  implicit none
  integer, public :: cycles_Secant
  double precision, public :: initial_guess_secant, pointC_Secant, resA_Secant, resB_Secant, resC_Secant
  double precision, private :: second_guess_secant, dummy
  real, public :: tolerance_Secant
  public :: calculate_secant

  interface
    module function calculate_secant()
      integer:: calculate_secant
    end function calculate_secant
  end interface
end module Secant
  submodule (Secant) output_process
  contains
    module function calculate_secant()
      second_guess_secant = .99*initial_guess_secant
      in = initial_guess_secant
      resA_Secant = evaluate_fx()
      in = second_guess_secant
      resB_Secant = evaluate_fx()
      dummy = ((resA_Secant * (second_guess_secant - initial_guess_secant)) / (resB_Secant - resA_Secant))
      pointC_Secant = initial_guess_secant - dummy
      in = pointC_Secant
      resC_Secant = evaluate_fx()
      do i = 1, cycles_Secant, 1
        in = initial_guess_secant
        resA_Secant = evaluate_fx()
        in = second_guess_secant
        resB_Secant = evaluate_fx()
        dummy = ((resA_Secant * (second_guess_secant - initial_guess_secant)) / (resB_Secant - resA_Secant))
        pointC_Secant = initial_guess_secant - dummy
        in = pointC_Secant
        resC_Secant = evaluate_fx()
        if ( ABS(resC_Secant)<tolerance_Secant ) then
          exit
        else
          second_guess_secant = initial_guess_secant
          initial_guess_secant = pointC_Secant
          resB_Secant = resC_Secant
        end if
      end do
      calculate_secant = i
    end function calculate_secant
  end submodule
