// An example with equality, inequality constraints and variable bounds
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

//Output
//Optimal Solution Found.
// lambda  =
// 
//   lower: [5.357D-12,2.334D-11,5.356D-12]
//   upper: [78,6.963D-12,49]
//   eqlin: 95
//   ineqlin: [1.206D-13,1.146D-13,1.449D-13]
// output  =
// 
//   Iterations: 8
//   ConstrViolation: 8.000D-08
// exitflag  =
// 
//  0  
// residual  =
// 
//    80.  
//    62.  
//    48.  
//    31.  
//    16.  
// resnorm  =
// 
//    13765.  
// xopt  =
// 
//    4.         
//    1.0000000  
//    4.  

[xopt,resnorm,residual,exitflag,output,lambda] = lsqlin(C,d,A,b,Aeq,beq,lb,ub)

