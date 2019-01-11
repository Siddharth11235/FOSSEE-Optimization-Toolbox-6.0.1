// Check for all zeros
C = [0];
d = [0];
A = [0];
b = [0];
// Output
//Optimal Solution Found.
// lambda  =
// 
//   lower: 0
//   upper: 0
//   eqlin: [0x0 constant]
//   ineqlin: 0.999901
// output  =
// 
//   Iterations: 2
//	 ConstrViolation: 0
// exitflag  =
// 
//  0  
// residual  =
// 
//    0.  
// resnorm  =
// 
//    0.  
// xopt  =
// 
//    0.     

[xopt,resnorm,residual,exitflag,output,lambda] = lsqlin(C,d,A,b)


