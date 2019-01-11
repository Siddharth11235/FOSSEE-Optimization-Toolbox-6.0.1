//Find x in R^6 such that:
// Check if the user gives unequal size of initial guess as of the number of variables
conMatrix= [1,-1,1,0,3,1;
-1,0,-3,-4,5,6;
2,5,3,0,1,0
0,1,0,1,2,-1;
-1,0,2,1,1,0];
conLB=[1;2;3;-%inf;-%inf];
conUB = [1;2;3;-1;2.5];
lb=[-1000;-10000; 0; -1000; -1000; -1000];
ub=[10000; 100; 1.5; 100; 100; 1000];
//and minimize 0.5*x'*Q*x + p'*x with
p=[1; 2; 3; 4; 5; 6]; Q=eye(6,6);
nbVar = 6;
nbCon = 5;
x0 = repmat(0,5,1);
param = list("MaxIter", 300, "CpuTime", 100);

//Error
// WARNING: quadprog: Ignoring initial guess of variables as it is not equal to the number of variables
// lambda  =
// 
//   lower: [1x6 constant]
//   upper: [1x6 constant]
//   constraint: [1x5 constant]
// output  =
// 
//   Iterations: 13
//	 ConstrViolation: 9.968D-09
// exitflag  =
// 
//  0  
// fopt  =
// 
//  - 14.843248  
// xopt  =
// 
//    1.7975426  
//  - 0.3381487  
//    0.1633880  
//  - 4.9884023  
//    0.6054943  
//  - 3.1155623  

[xopt,fopt,exitflag,output,lambda]=quadprog(nbVar,nbCon,Q,p,lb,ub,conMatrix,conLB,conUB,x0,param)

