// Copyright (C) 2015 - IIT Bombay - FOSSEE
//
// Author: Animesh Baranawal
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

// A case where we provide the gradient of the objective
// functions and the Jacobian matrix of the constraints.
// The objective function and its gradient
function f = myfun(x)
f(1)= 2*x(1)^2 + x(2)^2 - 48*x(1) - 40*x(2) + 304;
f(2)= -x(1)^2 - 3*x(2)^2;
f(3)= x(1) + 3*x(2) -18;
f(4)= -x(1) - x(2);
f(5)= x(1) + x(2) - 8;
endfunction
// Defining gradient of myfun
function G = myfungrad(x)
G = [ 4*x(1) - 48, -2*x(1), 1, -1, 1;
2*x(2) - 40, -6*x(2), 3, -1, 1; ]'
endfunction
// The nonlinear constraints and the Jacobian
// matrix of the constraints
function [c,ceq] = confun(x)
// Inequality constraints
c = [1.5 + x(1)*x(2) - x(1) - x(2), -x(1)*x(2) - 10]
// No nonlinear equality constraints
ceq=[]
endfunction
// Defining gradient of confungrad
function [DC,DCeq] = cgrad(x)
// DC(:,i) = gradient of the i-th constraint
// DC = [
//   Dc1/Dx1  Dc1/Dx2
//   Dc2/Dx1  Dc2/Dx2
//   ]
DC= [
x(2)-1, -x(2)
x(1)-1, -x(1)
]'
DCeq = []'
endfunction
// Test with both gradient of objective and gradient of constraints
minimaxOptions = list("GradObj",myfungrad,"GradCon",cgrad);
// The initial guess
x0 = [0,10];
// The expected solution : only 4 digits are guaranteed
//xopt = [0.92791 7.93551]
//fopt = [6.73443  -189.778  6.73443  -8.86342  0.86342]
maxfopt = 6.73443
// Run fminimax
[xopt,fopt,maxfval,exitflag,output] = fminimax(myfun,x0,[],[],[],[],[],[], confun, minimaxOptions)

assert_close ( xopt , [ 8.6737161 0.9348425 ]' , 0.0005 );
assert_close ( fopt , [ 1.6085585 -77.855143 -6.5217563 -9.6085587 1.6085587 ]' , 0.0005 );
assert_checkequal( exitflag , int32(0) );
printf("Test Successful");
