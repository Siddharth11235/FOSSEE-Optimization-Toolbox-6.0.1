// Copyright (C) 2015 - IIT Bombay - FOSSEE
//
// Author: Prajwala TM,Sheetal Shalini
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


function f1 = fun(x)
f1(1)=2*x(1)*x(1)+x(2)*x(2)-48*x(1)-40*x(2)+304
f1(2)=-x(1)*x(1)-3*x(2)*x(2)
f1(3)=x(1)+3*x(2)-18
f1(4)=-x(1)-x(2)
f1(5)=x(1)+x(2)-8
endfunction
x0=[-1,1]; 
goal=[-5,-3,-2,-1,-4];
weight=abs(goal)
//xopt  = [-0.0000011 -63.999998 -2.0000002 -8 3.485D-08]
//fval  = [4 3.99]
//Run fgoalattain
[xopt,fval,attainfactor,exitflag,output,lambda]=fgoalattain(fun,x0,goal,weight)

assert_close ( xopt , [ 4 4 ]' , 0.0005 );
assert_close ( fval , [ -0.0000011 -63.999998 -2.0000002 -8. 0 ]' , 0.0005 );
assert_checkequal( exitflag , int32(0) );
printf("Test Successful");
