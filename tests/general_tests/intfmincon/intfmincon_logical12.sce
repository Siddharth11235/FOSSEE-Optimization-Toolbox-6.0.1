// Example with Infeasible solution
function y=fun(x)
    y=-sum(exp(x))
endfunction

x0 = [repmat(1,1,20)];
A=[-1,-5,-3 repmat(0,1,17); -0.5,-2.5 -1.5 repmat(0,1,17);];
b=[-100 -50]';
intcon=[1,2];

lb = repmat(0,1,20);
ub = repmat(10,1,20);

// InFeasible Solution.
//  hessian  =
 
//      []
//  gradient  =
 
//      []
//  exitflag  =
 
//   1  
//  fopt  =
 
//     0.  
//  x0pt  =
 
//      []
 

[x0pt,fopt,exitflag,gradient,hessian] = intfmincon(fun,x0,intcon,A,b,[],[],lb,ub)
