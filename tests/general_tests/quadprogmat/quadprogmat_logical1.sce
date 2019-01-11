// A simple example without constraints

f=[2 -35 -47]'; 
H =[5   -2   -1;
	-2   4   3;
	-1   3   5];
[xopt,fopt,exitflag,output,lambda]=quadprogmat(H,f);

//Output
//
//Optimal Solution Found.
// 
//   lower: [0,0,0]
//   upper: [0,0,0]
//   ineqlin: [0x0 constant]
//   eqlin: [0x0 constant]
// 
// lambda   
// 
//   Iterations: 1
//	 ConstrViolation: 0
// output   
// 
//  0  
// 
// exitflag   
// 
//  - 249.  
// 
// fopt   
// 
//    3.  
//    5.  
//    7.  
// 
// xopt 

disp("xopt",xopt,"fopt",fopt,"exitflag",exitflag,"output",output,"lambda",lambda)

