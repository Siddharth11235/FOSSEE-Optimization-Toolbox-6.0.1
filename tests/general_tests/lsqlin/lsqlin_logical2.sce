// An example with equality and inequality constraints
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

//Output
//Optimal Solution Found.
// lambda  =
// 
//   lower: [0,0,0]
//   upper: [0,0,0]
//   eqlin: 73.833333
//   ineqlin: [2.571D-10,2.732D-10,2.571D-10]
// output  =
// 
//   Iterations: 7
//   ConstrViolation: 0
// exitflag  =
// 
//  0  
// residual  =
// 
//    37.666667  
//    54.75      
//    55.25      
//  - 18.583333  
//  - 19.083333  
// resnorm  =
// 
//    8178.4167  
// xopt  =
// 
//    53.583333  
//  - 41.333333  
//    39.083333 

[xopt,resnorm,residual,exitflag,output,lambda] = lsqlin(C,d,A,b,Aeq,beq)

