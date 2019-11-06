!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Author: Carlos García (cxrlos)                                               !
!                                                                              !
! Description: FORTRAN Program designed to input a custom function for the     !
! Main program.                                                                !
!                                                                              !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

module fx
  implicit none
  double precision, public :: in
  double precision, private :: pi = 4.d0*datan(1.d0)
  public :: evaluate_fx

  interface
    module function evaluate_fx()
      double precision :: evaluate_fx
    end function evaluate_fx
  end interface
end module fx

submodule (fx) calc_function
contains
  module function evaluate_fx()
    evaluate_fx = (in**3) + (5*in) - 3

  end function evaluate_fx
end submodule
