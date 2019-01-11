// An example with inequality constraints
c=[-1,-1/3]'
A=[1,1;1,1/4;1,-1;-1/4,-1;-1,-1;-1,1]
b=[2,1,2,1,-1,2]

//Output
//Optimal Solution Found.
// lambda  =
// 
//   lower: [0,0]
//   upper: [0,0]
//   eqlin: [0x0 constant]
//   ineqlin: [0.0000422,0.0000089]
// output  =
// 
//   Iterations: 13
//   ConstrViolation: 0
// exitflag  =
// 
//  0  
// residual  =
// 
//    0.3335021  
//    0.6666002  
//  - 0.3332976  
// resnorm  =
// 
//    0.6666667  
// xopt  =
// 
//    0.3332490  
//  - 0.3333512 

[xopt,fopt,exitflag,output,lambda]=linprog(c, A, b)


