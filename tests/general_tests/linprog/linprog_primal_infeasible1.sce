//Primal Infeasible Problem
c=[-1,-1,-1]'
A=[1,2,-1]
b=[-4]
Aeq=[1,5,3;1,1,0]
beq=[10,100]
lb=[0,0,0]
ub=[%inf,%inf,%inf]

//Output
//Primal Infeasible.
// lambda  =
// 
//   reduced_cost: [0,2.5,0]
//   ineqlin: -0.5
//   eqlin: [-0.5,0]
// output  =
// 
//   Iterations: 2
//   constrviolation: 100.5
// exitflag  =
// 
//    1.  
// fopt  =
// 
//  - 3.  
// xopt  =
// 
//  - 0.5  
//    0.   
//    3.5  

[xopt,fopt,exitflag,output,lambda]= linprog(c,A,b,Aeq,beq,lb,ub)

