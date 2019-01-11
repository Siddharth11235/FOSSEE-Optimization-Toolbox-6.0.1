// Copyright (C) 2015 - IIT Bombay - FOSSEE
//
// Author: R.Vidyadhar & Vignesh Kannan
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

//Find x in R^2 such that it minimizes the Rosenbrock function
//f = 100*(x2 - x1^2)^2 + (1-x1)^2
//Objective function to be minimised
function y= f(x)
y= 100*(x(2) - x(1)^2)^2 + (1-x(1))^2;
endfunction
//Starting point
x0=[-1,2];
//Gradient of objective function
function y= fGrad(x)
y= [-400*x(1)*x(2) + 400*x(1)^3 + 2*x(1)-2, 200*(x(2)-x(1)^2)];
endfunction
//Hessian of Objective Function
function y= fHess(x)
y= [1200*x(1)^2- 400*x(2) + 2, -400*x(1);-400*x(1), 200 ];
endfunction
//Options
options=list("MaxIter", [1500], "CpuTime", [500], "GradObj", fGrad, "Hessian", fHess);
//Calling Ipopt
[xopt,fopt,exitflag,output,gradient,hessian]=fminunc(f,x0,options)

assert_close ( xopt , [ 1 1 ]' , 0.0005 );
assert_close ( fopt , [0] , 0.0005 );
assert_checkequal( exitflag , int32(0) );
printf("Test Successful");
