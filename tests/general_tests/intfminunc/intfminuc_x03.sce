function [y,g,h] = f(x)
y = -x(1)^2 - x(2)^2;
g = [-2*x(1),-2*x(2)];
h = [-2,0;0,-2];
endfunction

x0=[1,1,1];
intcon = [1]
options = list("gradobj","ON","hessian","on");

//  !--error 10000 
// intfminunc_options: Expected 3 entries for input argument dy at input #12, but current dimensions are [1 2] instead.
// at line      54 of function Checkvector called by :  
// at line     231 of function intfminunc called by :  
// [xopt,fopt,exitflag,gradient,hessian]=intfminunc(f,x0,intcon,options)
// at line      10 of exec file called by :    
// exec intfminuc_x03.sce

[xopt,fopt,exitflag,gradient,hessian]=intfminunc(f,x0,intcon,options)
