// A simple example without constraints
A= [];
conLB=[];
conUB = [];
lb=[];
ub=[];
f=[2 -35 -47]'; 
H =[5   -2   -1; -2   4   3; -1   3   5];
nbVar = 3;
nbCon = 0;


//Output
//
//Optimal Solution Found.
// lambda  =
// 
//   lower: [0,0,0]
//   upper: [0,0,0]
//   constraint: [0x0 constant]
// output  =
// 
//   Iterations: 1
//   ConstrViolation: 0
// exitflag  =
// 
//  0  
// fopt  =
// 
//  - 249.  
// xopt  =
// 
//    3.  
//    5.  
//    7. 

[xopt,fopt,exitflag,output,lambda]=quadprog(nbVar,nbCon,H,f,lb,ub,A,conLB,conUB)

