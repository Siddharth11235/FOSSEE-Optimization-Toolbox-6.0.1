
// A simple example without constraints and all values to zero
A= [];
conLB=[];
conUB = [];
lb=[];
ub=[];
f=[0]'; 
H =[0];
nbVar = 1;
nbCon = 0;


//Output
//
//Optimal Solution Found.

//   lower: 0
//   upper: 0
//   constraint: [0x0 constant]
// 
// lambda   
// 
//   Iterations: 0
//	 ConstrViolation: 0
// output   
// 
//  0  
// 
// exitflag   
// 
//    0.  
// 
// fopt   
// 
//    0.  
// 
// xopt 

[xopt,fopt,exitflag,output,lambda]=quadprog(nbVar,nbCon,H,f,lb,ub,A,conLB,conUB)


