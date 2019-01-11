// Copyright (C) 2017 - IIT Bombay - FOSSEE
//
// Author: Georgey John
// Organization: FOSSEE, IIT Bombay
// Email: toolbox@scilab.in
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

// <-- JVM NOT MANDATORY -->
// <-- ENGLISH IMPOSED -->


//
// assert_close --
//   Returns 1 if the two real matrices computed and expected are close,
//   i.e. if the relative distance between computed and expected is lesser than epsilon.
// Arguments
//   computed, expected : the two matrices to compare
//   epsilon : a small number
//
function flag = assert_close ( computed, expected, epsilon )
  if expected==0.0 then
    shift = norm(computed-expected);
  else
    shift = norm(computed-expected)/norm(expected);
  end
//  if shift < epsilon then
//    flag = 1;
//  else
//    flag = 0;
//  end
//  if flag <> 1 then pause,end
    flag = assert_checktrue ( shift < epsilon );
endfunction
//
// assert_equal --
//   Returns 1 if the two real matrices computed and expected are equal.
// Arguments
//   computed, expected : the two matrices to compare
//   epsilon : a small number
//
//function flag = assert_equal ( computed , expected )
//  if computed==expected then
//    flag = 1;
//  else
//    flag = 0;
//  end
//  if flag <> 1 then pause,end
//endfunction


//Bound constrained optimization
function y=f(x)
y= x(1)^2 + x(2)^2 + 19*x(1) +5*x(2);
endfunction

x1=[4.5,7];

x2=[10,9];

intcon=[1 2];

//Calling fminunc function
[xopt,fopt,exitflag,gradient,hessian]=intfminbnd(f,intcon,x1,x2)

assert_close ( xopt , [ 5 7 ]' , 0.0005 );
assert_close ( fopt , [ 204 ]' , 0.0005 );
assert_checkequal( double(exitflag) , 0 );
printf("Test Successful");