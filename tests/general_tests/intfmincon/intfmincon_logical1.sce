// Example with objective function and inequality constraints

function y=fun(x)
y=x(1)*x(1)+x(2)*x(2);
endfunction

x0 = [1,2];
A=[1,1 ; 1,1/4 ; 1,-1 ; -1/4,-1 ; -1,-1 ; -1,1];
b=[2;1;2;1;-1;2];

//Output
//Optimal Solution Found.
// hessian  =
// 
//    2.         - 7.451D-09  
//  - 7.451D-09    2.         
// gradient  =
// 
//    1.0000000    1.  
// lambda  =
// 
//   lower: [0,0]
//   upper: [0,0]
//   ineqlin: [9.087D-09,2.424D-08,4.546D-09,5.596D-09,1,4.544D-09]
//   eqlin: [0x0 constant]
//   ineqnonlin: [0x0 constant]
//   eqnonlin: [0x0 constant]
// output  =
// 
//   Iterations: 8
//   Cpu_Time: 0.112
//   Objective_Evaluation: 9
//   Dual_Infeasibility: 1.299D-11
// exitflag  =
// 
//  0  
// fopt  =
// 
//    0.5  
// x0pt  =
// 
//    0.5000000  
//    0.5000000 

[x0pt,fopt,exitflag,gradient,hessian] = intfmincon(f,x0,intcon, A, b)
