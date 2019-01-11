
// Check if a user specifies value of linear equality contraints in accordance with starting point dimensions and coefficient matrix of linear equality constraints

function y=fun(x)
y=x(1)+x(2);
endfunction

x0 = [1,2];
A = [3,4];
b = [7];
Aeq = [7,5];
beq = [];
options=list("MaxIter", [1500], "CpuTime", [500], "Gradient", "OFF", "Hessian", "OFF");

//Error
//fmincon: Expected Non empty Row/Column Vector for beq (6th Parameter)
//at line     397 of function fmincon called by :  
//[xopt,fopt,exitflag,output,lambda,gradient,hessian] = fmincon (fun, x0, A, b, Aeq, beq);
//at line      22 of exec file called by :    
//exec fmincon_beq3.sce

[xopt,fopt,exitflag,output,lambda,gradient,hessian] = fmincon (fun, x0, A, b, Aeq, beq);
