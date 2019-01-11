
// Check if a user specifies correct format of gradient function or not

function [y] = f(x)
y = -x(1)^2 - x(2)^2;
endfunction

x0=[2,1];
intcon = [1]
options = list("gradobj","Fn");

//  !--error 999 
// Unknown string passed in gradobj.
// at line     200 of function intfminunc called by :  
// [xopt,fopt,exitflag,gradient,hessian]=intfminunc(f,x0,intcon,options)
// at line       8 of exec file called by :    
// exec intfminuc_gradient1.sce

[xopt,fopt,exitflag,gradient,hessian]=intfminunc(f,x0,intcon,options)
