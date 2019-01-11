//Find x in R^6 such that:
// An example with constraints and variable bounds
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

//Output
//
//Optimal Solution Found.
//
//   lower: [1x6 constant]
//   upper: [1x6 constant]
//   constraint: [1x5 constant]
// 
// lambda   
// 
//   Iterations: 13
//	 ConstrViolation: 9.968D-09
// output   
// 
//  0  
// 
// exitflag   
// 
//  - 14.843248  
// 
// fopt   
// 
//    1.7975426  
//  - 0.3381487  
//    0.1633880  
//  - 4.9884023  
//    0.6054943  
//  - 3.1155623  
// 
// xopt 

[xopt,fopt,exitflag,output,lambda]=quadprog(nbVar,nbCon,H,f,lb,ub,A,conLB,conUB);

disp("xopt",xopt,"fopt",fopt,"exitflag",exitflag,"output",output,"lambda",lambda)


