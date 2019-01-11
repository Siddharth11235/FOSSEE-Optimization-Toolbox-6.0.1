// Example with objective function using log functions

function y=fun(x)
y=log(x(1)+x(2));
endfunction

x0 = [1,2];
A=[1,1 ; 1,1/4 ; 1,-1 ; -1/4,-1 ; -1,-1 ; -1,1];
b=[2;1;2;1;-1;2];
intcon=[1,2];

//Output
// Optimal Solution Found.
//  hessian  =
 
//   - 1.  - 1.  - 1.  - 1.  
//  gradient  =
 
//     1.    1.  
//  exitflag  =
 
//   0  
//  fopt  =
 
//     0.  
//  x0pt  =
 
//     0.  
//     1. 

[x0pt,fopt,exitflag,gradient,hessian] = intfmincon(fun,x0,intcon, A, b)
