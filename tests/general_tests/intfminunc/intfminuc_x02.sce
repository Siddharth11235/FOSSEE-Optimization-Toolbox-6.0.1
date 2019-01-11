function [y,g,h] = f(x)
y = -x(1)^2 - x(2)^2;
g = [-2*x(1),-2*x(2)];
h = [-2,0;0,-2];
endfunction

x0=[1];
intcon = [1]
options = list("gradobj","ON","hessian","ON");

//  !--error 10000 
// intfminunc: Objective function and x0 did not match
// at line     221 of function intfminunc called by :  
// [xopt,fopt,exitflag]=intfminunc(f,x0,intcon,options)
// at line      10 of exec file called by :    
// exec intfminuc_x02.sce

[xopt,fopt,exitflag,gradient,hessian]=intfminunc(f,x0,intcon,options)
