
// Check if a user specifies upper bounds of linear inequality contraints in accordance with starting point dimensions and coefficient matrix of linear inequality constraints

function y=fun(x)
y=x(1)+x(2);
endfunction

x0 = [1,2];
A = [5,8];
b = [];
options=list("MaxIter", [1500], "CpuTime", [500], "Gradient", "OFF", "Hessian", "OFF");

//  !--error 10000 
// intfmincon: Expected a vector matrix for input argument b at input #5, but got [0 0] instead.
// at line      49 of function Checkvector called by :  
// at line     306 of function intfmincon called by :  
// [x0pt,fopt,exitflag,gradient,hessian] = intfmincon(f,x0,intcon, A, b);
// at line      20 of exec file called by :    
// exec intfmincon_b3.sce

[x0pt,fopt,exitflag,gradient,hessian] = intfmincon(f,x0,intcon, A, b);
