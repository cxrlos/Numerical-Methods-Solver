module dfx
  implicit none
  double precision, public :: in_dfx
  double precision, private :: pi = 4.d0*datan(1.d0)
  public :: evaluate_dfx
  interface
    module function evaluate_dfx()
      double precision :: evaluate_dfx
    end function evaluate_dfx
  end interface
end module dfx

submodule (dfx) calc_d_function
contains
  module function evaluate_dfx()
    evaluate_dfx = (3*in_dfx**2) + 5

  end function evaluate_dfx
end submodule
