// quadprogmat infeasibility test

H = [2 0;0 8];
f = [0 -32];
A = [-1 0; 0, -1; 1 1];
b = [-6 -6 11];
ub = [%inf %inf];
lb = -1*ub;

//Output
//Converged to a point of local infeasibility.
// lamda  =
// 
//   lower: [0x0 constant]
//   upper: [0x0 constant]
//   eqlin: [0x0 constant]
//   ineqlin: [0x0 constant]
// output  =
// 
//   Iterations: 105
//   ConstrViolation: 0.3752562
// exitflag  =
// 
//  5  
// fopt  =
// 
//  - 21.80307  
// xopt  =
// 
//    5.6247453  
//    5.6247438 

[xopt,fopt,exitflag,output,lamda] = quadprogmat(H,f,A,b,[],[],lb,ub)
