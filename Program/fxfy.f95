module fxfy
  implicit none
  double precision, public :: in_x, in_y
  double precision, private :: pi = 4.d0*datan(1.d0)
  public :: evaluate_fxfy
  interface
    module function evaluate_fxfy()
      double precision :: evaluate_fxfy
    end function evaluate_fxfy
  end interface
end module fxfy

submodule (fxfy) calc_function
contains
  module function evaluate_fxfy()
    evaluate_fxfy = (in**3) + (5*in) - 3

  end function evaluate_fxfy
end submodule
