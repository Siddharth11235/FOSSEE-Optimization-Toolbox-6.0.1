
// Check if a user specifies value of linear equality contraints in accordance with starting point dimensions and coefficient matrix of linear equality constraints

function y=fun(x)
y=x(1)+x(2);
endfunction

x0 = [1,2];
A = [3,4];
b = [7];
Aeq = [];
beq = [2,6];
intcon=[1,2];
options=list("MaxIter", [1500], "CpuTime", [500], "Gradient", "OFF", "Hessian", "OFF");

//  !--error 6 
// Inconsistent row/column dimensions.
// at line     430 of function intfmincon called by :  
// [x0pt,fopt,exitflag,gradient,hessian] = intfmincon(f,x0,intcon, A, b, Aeq, beq);
// at line      22 of exec file called by :    
// exec intfmincon_beq2.sce


[x0pt,fopt,exitflag,gradient,hessian] = intfmincon(f,x0,intcon, A, b, Aeq, beq);
