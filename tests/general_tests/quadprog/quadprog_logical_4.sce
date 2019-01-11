// A simple example without constraints
A= [];
conLB=[];
conUB = [];
lb=repmat(0,3,1);
ub=repmat(3,3,1);
f=[2 -35 -47]'; 
H =[5   -2   -1; -2   4   3; -1   3   5];
nbVar = 3;
nbCon = 0;


//Output
//
//Optimal Solution Found.
// lambda  =
// 
//   lower: [7.097D-12,3.333D-12,3.333D-12]
//   upper: [6.559D-12,16.8,24.4]
//   constraint: [0x0 constant]
// output  =
// 
//   Iterations: 8
//   ConstrViolation: 0
// exitflag  =
// 
//  0  
// fopt  =
// 
//  - 183.4  
// xopt  =
// 
//    1.4  
//    3.   
//    3.    

[xopt,fopt,exitflag,output,lambda]=quadprog(nbVar,nbCon,H,f,lb,ub,A,conLB,conUB)


