module FalsePosition
  use fx
  implicit none
  integer, public :: cycles_False_Position
  double precision, public :: pointA_False_Position, pointB_False_Position, pointC_False_Position
  double precision, public :: resA_False_Position, resB_False_Position, resC_False_Position, dummy
  real, public :: tolerance_False_Position
  public :: calculate_false_position

  interface
    module function calculate_false_position()
      integer:: calculate_false_position
    end function calculate_false_position
  end interface
end module FalsePosition

submodule (FalsePosition) output_process
contains
  module function calculate_false_position()
    do i = 1, cycles_False_Position, 1
      in = pointA_False_Position
      resA_False_Position = evaluate_fx()
      in = pointB_False_Position
      resB_False_Position = evaluate_fx()
      dummy = ((resB_False_Position*(pointB_False_Position-pointA_False_Position))/(resB_False_Position-resA_False_Position))
      pointC_False_Position = pointB_False_Position - dummy
      in = pointC_False_Position
      resC_False_Position = evaluate_fx()
      if ( ABS(resC_False_Position)<tolerance_False_Position ) then
        exit
      else if ( resC_False_Position * resA_False_Position > 0 ) then
        pointA_False_Position = pointC_False_Position
      else if ( resC_False_Position * resA_False_Position < 0 ) then
        pointB_False_Position = pointC_False_Position
      end if
    end do
    calculate_false_position = i
  end function calculate_false_position
end submodule
