// gradient should be provided when hessian is ON
function [y] = f(x)
y = -x(1)^2 - x(2)^2;
h = [-2,0];
endfunction

x0=[2,1];
intcon = [1]
options = list("hessian","ON");

//  !--error 10000 
// intfminunc: Gradient of objective function is not provided
// at line     238 of function intfminunc called by :  
// [xopt,fopt,exitflag,gradient,hessian]=intfminunc(f,x0,intcon,options)
// at line       9 of exec file called by :    
// exec intfminuc_hessian4.sce

[xopt,fopt,exitflag,gradient,hessian]=intfminunc(f,x0,intcon,options)
