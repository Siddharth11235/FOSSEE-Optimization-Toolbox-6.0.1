// An example with C, d and options
C = [1 1 1;
	1 1 0;
	0 1 1;
	1 0 0;
	0 0 1]
d = [89;
	67;
	53;
	35;
	20]
options = list("MaxIter", 300);

//Output
//Optimal Solution Found.
// lambda  =
// 
//   lower: [5.131D-09,5.546D-09,8.739D-09]
//   upper: [0,0,0]
// output  =
// 
//   Iterations: 7
//	 ConstrViolation: 0
// exitflag  =
// 
//  0  
// residual  =
// 
//    0.75   
//  - 0.625  
//  - 0.125  
//  - 0.125  
//  - 0.625  
// resnorm  =
// 
//    1.375  
// xopt  =
// 
//    35.125  
//    32.5    
//    20.625  

[xopt,resnorm,residual,exitflag,output,lambda] = lsqnonneg(C,d,options)

