// Example with objective function and inequality constraints
function y=fun(x)
    y=sum((sin(x)).^2 + (cos(x)).^2)
endfunction

x0 = [repmat(1,1,3)];
A=[-1,-5,-3; -0.5,-2.5 -1.5;];
b=[-100 -50]';
lb = repmat(0,1,3);
intcon=[1,2];

// Optimal Solution Found.
//  hessian  =
 
//     0.    0.    0.    0.    0.    0.    0.    0.    0.  
//  gradient  =
 
//     0.    0.    0.  
//  exitflag  =
 
//   0  
//  fopt  =
 
//     3.  
//  x0pt  =
 
//     7115.      
//     10.        
//     51309.553  

[x0pt,fopt,exitflag,gradient,hessian] = intfmincon(fun,x0,intcon,A,b,[],[],lb,[])
