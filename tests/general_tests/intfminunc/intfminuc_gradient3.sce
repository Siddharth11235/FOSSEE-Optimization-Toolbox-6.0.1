// Check if a user specifies correct format of gradient function or not

function [y] = f(x)
y = -x(1)^2 - x(2)^2;
endfunction

grad=[];
x0=[2,1];
intcon = [1]
options = list("gradobj",grad);

//  !--error 10000 
// intfminbnd_options: Expected type ["string"] for input argument gradobj at input #2, but got "constant" instead.
// at line      56 of function Checktype called by :  
// at line     194 of function intfminunc called by :  
// [xopt,fopt,exitflag,gradient,hessian]=intfminunc(f,x0,intcon,options)
// at line       8 of exec file called by :    
// exec intfminuc_gradient3.sce

[xopt,fopt,exitflag,gradient,hessian]=intfminunc(f,x0,intcon,options)
