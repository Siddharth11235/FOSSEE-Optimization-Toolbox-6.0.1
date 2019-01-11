// Check for the infeasible problem
C = [2 0 0;
	-1 1 0;
	 0 2 0]
d = [1
	 0
    -1];
Aeq = [-1 0 0; 0 -1 0; 1 1 0 ];
beq = [-6 -6 11];

//Converged to a point of local infeasibility.
// lambda  =
// 
//   lower: [0x0 constant]
//   upper: [0x0 constant]
//   eqlin: [0x0 constant]
//   ineqlin: [0x0 constant]
// output  =
// 
//   Iterations: 105
//   ConstrViolation: 0.3333333
// exitflag  =
// 
//  5  
// residual  =
// 
//  - 10.333333  
//  - 1.021D-13  
//  - 12.333333  
// resnorm  =
// 
//    258.88889  
// xopt  =
// 
//    5.6666667  
//    5.6666667  
//    0. 
[xopt,resnorm,residual,exitflag,output,lambda] = lsqlin(C,d,[],[],Aeq,beq)

