//Find x in R^6 such that:
// A simple example with constraints
A= [1,-1,1,0,3,1;
-1,0,-3,-4,5,6;
2,5,3,0,1,0
0,1,0,1,2,-1;
-1,0,2,1,1,0];
conLB=[1;2;3;-%inf;-%inf];
conUB = [1;2;3;-1;2.5];
lb=[-1000;-10000; 0; -1000; -1000; -1000];
ub=[10000; 100; 1.5; 100; 100; 1000];
//and minimize 0.5*x'*H*x + f'*x with
f=[1; 2; 3; 4; 5; 6]; H=eye(6,6);
nbVar = 6;
nbCon = 5;
x0 = repmat(0,nbVar,1);
param = list("MaxIter", 1);

//Output
//Maximum Number of Iterations Exceeded. Output may not be optimal.
// lambda  =
// 
//   lower: [0x0 constant]
//   upper: [0x0 constant]
//   constraint: [0x0 constant]
// output  =
// 
//   Iterations: 1
//	 ConstrViolation: 1.3770464
// exitflag  =
// 
//  1  
// fopt  =
// 
//  - 9.9784864  
// xopt  =
// 
//    0.9103357  
//  - 0.1104630  
//    0.0476471  
//  - 2.0070896  
//    0.2116560  
//  - 1.1624291 

[xopt,fopt,exitflag,output,lambda]=quadprog(nbVar,nbCon,H,f,lb,ub,A,conLB,conUB,x0,param)


