// A simple example without constraints

f=[0]'; 
H =[0];

//Output
//
//Optimal Solution Found.
// 
//   lower: 0
//   upper: 0
//   eqlin: [0x0 constant]
//   ineqlin: [0x0 constant]
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


[xopt,fopt,exitflag,output,lambda]=quadprogmat(H,f)

