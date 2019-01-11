// Check if a user specifies correct format of gradient function or not

function [y,g] = f(x)
y = -x(1)^2 - x(2)^2;
g = [-2*x(1)];
endfunction

x0=[2,1];
intcon = [1]
options = list("gradobj","ON");

//  !--error 10000 
// intfminunc_options: Expected 2 entries for input argument dy at input #12, but current dimensions are [1 1] instead.
// at line      54 of function Checkvector called by :  
// at line     231 of function intfminunc called by :  
// [xopt,fopt,exitflag,gradient,hessian]=intfminunc(f,x0,intcon,options)
// at line       9 of exec file called by :    
// exec intfminuc_gradient4.sce
 

[xopt,fopt,exitflag,gradient,hessian]=intfminunc(f,x0,intcon,options)
