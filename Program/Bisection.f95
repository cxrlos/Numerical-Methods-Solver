module Bisection
  use fx
  implicit none
  integer, public :: cycles_Bisection
  double precision, public :: pointA_Bisection, pointB_Bisection, pointC_Bisection, resA_Bisection, resC_Bisection
  real, public :: tolerance_Bisection
  public :: calculate_bisection

  interface
    module function calculate_bisection()
      integer:: calculate_bisection
    end function calculate_bisection
  end interface
end module Bisection
  submodule (Bisection) output_process
  contains
    module function calculate_bisection()
      do i = 1, cycles_Bisection, 1
        pointC_Bisection= ((pointA_Bisection+pointB_Bisection)/2)
        in = pointA_Bisection
        resA_Bisection = evaluate_fx()
        in = pointC_Bisection
        resC_Bisection = evaluate_fx()
        if ( ABS(resC_Bisection)< tolerance_Bisection ) then
          exit
        else if ( resC_Bisection * resA_Bisection > 0 ) then
          pointA_Bisection = pointC_Bisection
          pointC_Bisection = (pointB_Bisection + pointC_Bisection) / 2
        else if ( resC_Bisection * resA_Bisection < 0 ) then
          pointB_Bisection = pointC_Bisection
          pointC_Bisection = (pointA_Bisection + pointC_Bisection) / 2
        end if
      end do
      calculate_bisection = i
    end function calculate_bisection
  end submodule
