
// Check if a user specifies a starting point of the correct dimensions with respect to the objective function

function y=fun(x)
y=x(1)+x(2);
endfunction

x0 = [1];
A = [3,4];
b = [7,9];
options=list("MaxIter", [1500], "CpuTime", [500]);

// //  !--error 999 
// Expected Matrix of size (No of linear inequality constraints X No of Variables) or
//  an Empty Matrix for Linear Inequality Constraint coefficient Matrix A
//  at line     285 of function intfmincon called by :  
// [x0pt,fopt,exitflag,gradient,hessian] = intfmincon(f,x0,intcon, A, b);
// at line      20 of exec file called by :    
// exec intfmincon_x0b.sce


[x0pt,fopt,exitflag,gradient,hessian] = intfmincon(f,x0,intcon, A, b);
