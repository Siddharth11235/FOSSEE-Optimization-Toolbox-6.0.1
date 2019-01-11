function [y,g,h] = f(x)
y = -x(1)^2 - x(2)^2;
g = [-2*x(1),-2*x(2)];
h = [-2,0;0,-2];
endfunction

x0=[];
intcon = [1]
options = list("gradobj","ON","hessian","on");
//  !--error 10000 
// intfminunc: Expected a vector matrix for input argument x0 at input #2, but got [0 0] instead.
// at line      49 of function Checkvector called by :  
// at line     141 of function intfminunc called by :  
// [xopt,fopt,exitflag,gradient,hessian]=intfminunc(f,x0,intcon,options)
// at line      10 of exec file called by :    
// exec intfminuc_x01.sce

[xopt,fopt,exitflag]=intfminunc(f,x0,intcon,options)
