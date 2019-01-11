
// Check if a user specifies value of linear equality contraints in accordance with starting point dimensions and coefficient matrix of linear equality constraints

function y=fun(x)
y=x(1)+x(2);
endfunction

x0 = [1,2];
A = [3,4];
b = [7];
Aeq = [7,5];
beq = [];
intcon=[1,2];
options=list("MaxIter", [1500], "CpuTime", [500], "Gradient", "OFF", "Hessian", "OFF");

//  !--error 10000 
// intfmincon: Expected a vector matrix for input argument beq at input #7, but got [0 0] instead.
// at line      49 of function Checkvector called by :  
// at line     310 of function intfmincon called by :  
// [x0pt,fopt,exitflag,gradient,hessian] = intfmincon(f,x0,intcon, A, b, Aeq, beq);
// at line      22 of exec file called by :    
// exec intfmincon_beq3.sce

[x0pt,fopt,exitflag,gradient,hessian] = intfmincon(f,x0,intcon, A, b, Aeq, beq);
