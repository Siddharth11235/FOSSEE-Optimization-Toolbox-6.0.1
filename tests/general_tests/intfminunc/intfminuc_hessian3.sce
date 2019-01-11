// Check if a user specifies correct format of hessian function or not
function [y] = f(x)
y = -x(1)^2 - x(2)^2;
endfunction
hessian=[]
x0=[2,1];
intcon = [1]
options = list("hessian",hessian);

//  !--error 10000 
// intfminbnd_options: Expected type ["string"] for input argument hessian at input #2, but got "constant" instead.
// at line      56 of function Checktype called by :  
// at line     203 of function intfminunc called by :  
// [xopt,fopt,exitflag,gradient,hessian]=intfminunc(f,x0,intcon,options)
// at line       8 of exec file called by :    
// exec intfminuc_hessian3.sce

[xopt,fopt,exitflag,gradient,hessian]=intfminunc(f,x0,intcon,options)
