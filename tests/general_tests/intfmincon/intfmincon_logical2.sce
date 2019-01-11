// Example with objective function, equality and inequality constraints

function y=fun(x)
y=x(1)*x(1)+x(2)*x(2);
endfunction

x0 = [1,2];
A=[1,1 ; 1,1/4 ; 1,-1 ; -1/4,-1 ; -1,-1 ; -1,1];
b=[2;1;2;1;-1;2];
Aeq = [1,3]
beq= [1.5]

//Output
//Optimal Solution Found.
// hessian  =
// 
//    2.    0.  
//    0.    2.  
// gradient  =
// 
//    1.5    0.5000000  
// lambda  =
// 
//   lower: [0,0]
//   upper: [0,0]
//   ineqlin: [9.089D-09,4.842D-08,6.059D-09,6.324D-09,2.0000001,3.637D-09]
//   eqlin: 0.5000000
//   ineqnonlin: [0x0 constant]
//   eqnonlin: [0x0 constant]
// output  =
// 
//   Iterations: 8
//   Cpu_Time: 0.092
//   Objective_Evaluation: 9
//   Dual_Infeasibility: 1.869D-11
// exitflag  =
// 
//  0  
// fopt  =
// 
//    0.6250000  
// x0pt  =
// 
//    0.7500000  
//    0.25  

[x0pt,fopt,exitflag,gradient,hessian] = intfmincon(f,x0,intcon, A, b,Aeq,beq)
