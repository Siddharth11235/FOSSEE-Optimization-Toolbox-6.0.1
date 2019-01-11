// Example with objective function using exponential input

function y=fun(x)
    y=exp(x(2)*x(1));
endfunction

x0 = [1,2];
A=[1,1 ; 1,1/4];
b=[2;1];

//Output
//Optimal Solution Found.
// hessian  =
// 
//    0.0000010  - 0.0000007  
//  - 0.0000007    0.0000005  
// gradient  =
// 
//    7.127D-08  - 5.690D-08  
// lambda  =
// 
//   lower: [0,0]
//   upper: [0,0]
//   ineqlin: [6.963D-09,2.501D-09]
//   eqlin: [0x0 constant]
//   ineqnonlin: [0x0 constant]
//   eqnonlin: [0x0 constant]
// output  =
// 
//   Iterations: 15
//   Cpu_Time: 0.132
//   Objective_Evaluation: 16
//   Dual_Infeasibility: 8.073D-08
// exitflag  =
// 
//  0  
// fopt  =
// 
//    1.500D-08  
// xopt  =
// 
//  - 3.7925137  
//    4.7501487 

[xopt,fopt,exitflag,output,lambda,gradient,hessian] = fmincon (fun, x0, A, b)
