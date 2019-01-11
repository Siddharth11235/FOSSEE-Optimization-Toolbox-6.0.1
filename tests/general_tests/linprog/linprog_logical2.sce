// An example with inequality and equality constraints
c=[-1,-1/3]'
A=[1,1;1,1/4;1,-1;-1/4,-1;-1,-1;-1,1]
b=[2,1,2,1,-1,2]
Aeq=[1,1/4]
beq=[1/2]

//Output
//Optimal Solution.
// lambda  =
// 
//   reduced_cost: [0,0]
//   ineqlin: [-0.1111111,0,0,0,0,0]
//   eqlin: -0.8888889
// output  =
// 
//   Iterations: 0
//   constrviolation: 0
// exitflag  =
// 
//    0.  
// fopt  =
// 
//  - 0.6666667  
// xopt  =
// 
//    0.  
//    2.  

[xopt,fopt,exitflag,output,lambda]=linprog(c, A, b, Aeq, beq)


