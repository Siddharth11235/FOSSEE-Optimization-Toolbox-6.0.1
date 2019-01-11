// Check for all zeros as input
C = [0];
d = [0];

//Output
//Optimal Solution Found.
// lambda  =
// 
//   lower: 6.400D-11
//   upper: 0
// output  =
// 
//   Iterations: 3
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
//    0.9124275  

[xopt,resnorm,residual,exitflag,output,lambda] = lsqnonneg(C,d)

