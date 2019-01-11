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

 //A simple linear least square example
C = [1 1 1;
	1 1 0;
	0 1 1;
	1 0 0;
	0 0 1]
d = [89;
	67;
	53;
	35;
	20;]
A = [3 2 1;
	2 3 4;
	1 2 3];
b = [191
	209
	162];
Aeq = [1 2 1];
beq = 10;
lb = repmat(0.1,3,1);
ub = repmat(4,3,1);
[xopt,resnorm,residual,exitflag,output,lambda] = lsqlin(C,d,A,b,Aeq,beq,lb,ub)

assert_close ( xopt , [ 4 1 4 ]' , 0.0005 );
assert_close ( residual , [80 62 48 31 16]' , 0.0005 );
assert_close ( resnorm , [ 13765] , 0.0005 );
assert_checkequal( exitflag , int32(0) );
printf("Test Successful");
