// Check for elements all zeros
c=[-1,-1/3]'
A=[1,1;1,1/4;1,-1;-1/4,-1;-1,-1;-1,1]
b=[2,1,2,1,-1,2]
Aeq=[1,1/4]
beq=[1/2]

//Output
//Optimal Solution.
// lambda  =
// 
//   reduced_cost: 0
//   ineqlin: 0
//   eqlin: [0x0 constant]
// output  =
// 
//   Iterations: 4
//   constrviolation: 0
// exitflag  =
// 
//    0.  
// fopt  =
// 
//    0.  
// xopt  =
// 
//    0. 

[xopt,fopt,exitflag,output,lambda]=linprog(0,0,0)

