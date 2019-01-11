// Check if a user specifies correct format of hessian function or not
function [y] = f(x)
y = -x(1)^2 - x(2)^2;
endfunction

x0=[2,1];
intcon = [1]
options = list("hessian","");

//  !--error 999 
// Unknown string passed in hessian.
// at line     209 of function intfminunc called by :  
// [xopt,fopt,exitflag,gradient,hessian]=intfminunc(f,x0,intcon,options)
// at line       8 of exec file called by :    
// exec intfminuc_hessian2.sce

[xopt,fopt,exitflag,gradient,hessian]=intfminunc(f,x0,intcon,options)
