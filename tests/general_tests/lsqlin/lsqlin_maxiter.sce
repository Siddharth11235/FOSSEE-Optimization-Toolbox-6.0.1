// Check for maxiter
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
options = list("MaxIter",1);
// Output
//Maximum Number of Iterations Exceeded. Output may not be optimal.
// lambda  =
// 
//   lower: [0x0 constant]
//   upper: [0x0 constant]
//   eqlin: [0x0 constant]
//   ineqlin: [0x0 constant]
// output  =
// 
//   Iterations: 1
// exitflag  =
// 
//  1  
// residual  =
// 
//    1.0243179  
//    0.3941271  
//  - 0.1874278  
// resnorm  =
// 
//    1.2396926  
// xopt  =
// 
//  - 0.0121590  
//  - 0.4062861 

[xopt,resnorm,residual,exitflag,output,lambda] = lsqlin(C,d,A,b,[],[],[],[],[],options)


