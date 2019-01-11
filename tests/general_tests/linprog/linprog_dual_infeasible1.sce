 //Dual Infeasible Problem
 c=[3,5,-7]'
 A=[-1,-1,4;1,1,4]
 b=[-8,5]
 Aeq=[]
 beq=[]
 lb=[-%inf,-%inf,-%inf]
 ub=[%inf,%inf,%inf]
 //Output
 // Dual Infeasible.
 // lambda  =
 // 
 //   reduced_cost: [0,2,0] 
 //   ineqlin: [-2.375,0.625]
 //   eqlin: [0x0 constant]
 // output  =
 // 
 //   Iterations: 2
 //   constrviolation: 0
 // exitflag  =
 // 
 //    2.  
 // fopt  =
 // 
 //    22.125  
 // xopt  =
 // 
 //    6.5    
 //    0.     
 //  - 0.375  
 [xopt,fopt,exitflag,output,lambda]= linprog(c,A,b,Aeq,beq,lb,ub)
