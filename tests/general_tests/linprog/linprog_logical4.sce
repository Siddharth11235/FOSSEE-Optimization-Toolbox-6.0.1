// An example with inequality constraints
c=[-1,-1/3]'
A=[1,1;1,1/4;1,-1;-1/4,-1;-1,-1;-1,1]
b=[2,1,2,1,-1,2]
Aeq=[1,1/4]
beq=[1/2]
lb=[-1,-0.5]
ub=[1.5,1.25]
params = list("maxiter",20)

//Output
//Optimal Solution.
// lambda  =
// 
//   reduced_cost: [0,-0.0833333]
//   ineqlin: [0,0,0,0,0,0]
//   eqlin: -1
// output  =
// 
//   Iterations: 0
//   constrviolation: 0
// exitflag  =
// 
//    0.  
// fopt  =
// 
//  - 0.6041667  
// xopt  =
// 
//    0.1875  
//    1.25 

[xopt,fopt,exitflag,output,lambda]=linprog(c, A, b, Aeq, beq, lb, ub,params)
