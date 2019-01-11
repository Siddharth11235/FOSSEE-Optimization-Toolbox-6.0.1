// Copyright (C) 2015 - IIT Bombay - FOSSEE
//
// Author: Harpreet Singh
// Organization: FOSSEE, IIT Bombay
// Email: harpreet.mertia@gmail.com
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

//A simple non-linear least square example taken from leastsq default present in scilab
function y=yth(t, x)
y  = x(1)*exp(-x(2)*t)
endfunction
// we have the m measures (ti, yi):
m = 10;
tm = [0.25, 0.5, 0.75, 1.0, 1.25, 1.5, 1.75, 2.0, 2.25, 2.5]';
ym = [0.79, 0.59, 0.47, 0.36, 0.29, 0.23, 0.17, 0.15, 0.12, 0.08]';
// measure weights (here all equal to 1...)
wm = ones(m,1);
// and we want to find the parameters x such that the model fits the given
// data in the least square sense:
//
//  minimize  f(x) = sum_i  wm(i)^2 ( yth(tm(i),x) - ym(i) )^2
// initial parameters guess
x0 = [1.5 ; 0.8];
// in the first examples, we define the function fun and dfun
// in scilab language
function y=myfun(x, tm, ym, wm)
y = wm.*( yth(tm, x) - ym )
endfunction
// the simplest call
[xopt,resnorm,residual,exitflag,output,lambda,gradient] = lsqnonlin(myfun,x0)

assert_close ( xopt , [ 0.9940629 0.9904811 ]' , 0.0005 );
assert_close ( residual , [-0.0139785 0.0158061 0.0029263 0.0091929 -0.0017872 -0.0050049 0.0056439 -0.0128825 -0.0129584 0.0035627]' , 0.0005 );
assert_close ( resnorm , [ 0.0009450] , 0.0005 );
assert_checkequal( exitflag , int32(0) );
printf("Test Successful");
