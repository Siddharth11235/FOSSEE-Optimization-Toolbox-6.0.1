// Check for maxiter
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
options = list("MaxIter",1)
//Output
//Maximum Number of Iterations Exceeded. Output may not be optimal.
// lambda  =
// 
//   lower: [0x0 constant]
//   upper: [0x0 constant]
// output  =
// 
//   Iterations: 1
//	 ConstrViolation: 0
// exitflag  =
// 
//  1  
// residual  =
// 
//    83.449663  
//    63.182327  
//    49.319768  
//    33.129895  
//    18.267336  
// resnorm  =
// 
//    14819.578  
// xopt  =
// 
//    1.8701046  
//    1.9475681  
//    1.7326638  

[xopt,resnorm,residual,exitflag,output,lambda] = lsqnonneg(C,d,options)

