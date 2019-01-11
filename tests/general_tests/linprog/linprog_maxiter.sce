// An example with inequality constraints
c=[-1,-1/3]'
A=[1,1;1,1/4;1,-1;-1/4,-1;-1,-1;-1,1]
b=[2,1,2,1,-1,2]

param = list("maxiter",3)

//Output
//Iteration limit reached.
// lambda  =
// 
//   reduced_cost: [0,0]
//   ineqlin: [0,0,0,0,0.6666667,0.3333333]
//   eqlin: [0x0 constant]
// output  =
// 
//   Iterations: 3
//   constrviolation: 0.7999992
// exitflag  =
// 
//    3.  
// fopt  =
// 
//  - 1.1999995  
// xopt  =
// 
//    0.3999996  
//    2.3999996  

[xopt,fopt,exitflag,output,lambda]=linprog(c, A, b,[],[],[],[],param)


