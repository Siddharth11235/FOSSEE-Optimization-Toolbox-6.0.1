
// Check if a user specifies coefficients of linear equality contraints of the correct dimensions 

function y=fun(x)
y=x(1)+x(2);
endfunction

x0 = [1,2];
A = [3,4];
b = [7];
Aeq = [1,4,9];
beq = [2];
intcon = [1,2];
options=list("MaxIter", [1500], "CpuTime", [500], "Gradient", "OFF", "Hessian", "OFF");

//Error
//intfmincon: Expected Matrix of size (No of linear equality constraints X No of Variables) or an Empty Matrix for Linear Equality Constraint coefficient Matrix Aeq
//at line     380 of function fmincon called by :  
//[x0pt,fopt,exitflag,output,gradient,hessian] = intfmincon(fun,x0,intcon, A, b, Aeq, beq);
//at line      22 of exec file called by :    
//exec intfmincon_Aeq.sce

[x0pt,fopt,exitflag,gradient,hessian] = intfmincon(fun,x0,intcon, A, b, Aeq, beq);
