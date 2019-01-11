// Test for intial guess
C = [2 0;
	-1 1;
	 0 2]
d = [1
	 0
    -1];
A = [10 -2;
	 -2 10];
b = [4
    -4];
x0 = [0 0 0];

//WARNING: lsqlin: Ignoring initial guess of variables as it is not equal to the number of variables

//Optimal Solution Found.
// lambda  =
// 
//   lower: [0,0]
//   upper: [0,0]
//   eqlin: [0x0 constant]
//   ineqlin: [0.0000422,0.0000089]
// output  =
// 
//   Iterations: 13
//	 ConstrViolation: 0
// exitflag  =
// 
//  0  
// residual  =
// 
//    0.3335021  
//    0.6666002  
//  - 0.3332976  
// resnorm  =
// 
//    0.6666667  
// xopt  =
// 
//    0.3332490  
//  - 0.3333512  

[xopt,resnorm,residual,exitflag,output,lambda] = lsqlin(C,d,A,b,[],[],[],[],x0)


