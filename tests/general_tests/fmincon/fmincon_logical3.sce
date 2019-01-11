// Example with objective function, equality, inequality constraints and variable bounds

function y=fun(x)
y=x(1)*x(1)+x(2)*x(2);
endfunction

x0 = [1,2];
A=[1,1 ; 1,1/4 ; 1,-1 ; -1/4,-1 ; -1,-1 ; -1,1];
b=[2;1;2;1;-1;2];
Aeq = [1,3]
beq= [5]
lb = [0 0]
ub = [2 1.5]

//Output
//Optimal Solution Found.
// hessian  =
// 
//    2.    0.  
//    0.    2.  
// gradient  =
// 
//    0.9999999    3.  
// lambda  =
// 
//   lower: [1.820D-08,6.060D-09]
//   upper: [6.059D-09,0.7267088]
//   ineqlin: [0.3633544,7.251D-08,3.030D-09,3.463D-09,9.093D-09,9.096D-09]
//   eqlin: -1.3633544
//   ineqnonlin: [0x0 constant]
//   eqnonlin: [0x0 constant]
// output  =
// 
//   Iterations: 21
//   Cpu_Time: 0.2
//   Objective_Evaluation: 26
//   Dual_Infeasibility: 9.075D-11
// exitflag  =
// 
//  0  
// fopt  =
// 
//    2.5  
// xopt  =
// 
//    0.5000000  
//    1.5  

[xopt,fopt,exitflag,output,lambda,gradient,hessian] = fmincon (fun, x0, A, b, Aeq, beq, lb, ub)
