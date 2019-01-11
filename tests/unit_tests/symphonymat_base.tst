// Copyright (C) 2015 - IIT Bombay - FOSSEE
//
// Author: Keyur Joshi and Harpreet Singh
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

// Reference: Westerberg, Carl-Henrik, Bengt Bjorklund, and Eskil Hultman. "An application of mixed integer programming in a Swedish steel mill." Interfaces 7, no. 2 (1977): 39-43.
// Objective function
c = [350*5,330*3,310*4,280*6,500,450,400,100]';

// Lower Bound of variable
lb = repmat(0,1,8);

// Upper Bound of variables
ub = [repmat(1,1,4) repmat(%inf,1,4)];

// Constraint Matrix
Aeq = [5,3,4,6,1,1,1,1;
             5*0.05,3*0.04,4*0.05,6*0.03,0.08,0.07,0.06,0.03;
             5*0.03,3*0.03,4*0.04,6*0.04,0.06,0.07,0.08,0.09;]


beq = [ 25, 1.25, 1.25]

intcon = [1 2 3 4];

// Calling Symphony
[x,f,status,output] = symphonymat(c,intcon,[],[],Aeq,beq,lb,ub);

assert_close ( x , [1 1 0 1 7.25 0 0.25 3.5]' , 1.e-7 );
assert_close ( f , [ 8495] , 1.e-7 );
assert_checkequal( status , 227 );

printf("Test Successfull")
