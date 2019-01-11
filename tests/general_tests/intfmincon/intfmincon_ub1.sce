
//Check if upper bound is a vector 

function y=fun(x)
y=x(1)+x(2);
endfunction

x0 = [1,2];
A = [3,4];
b = [7];
Aeq = [];
beq = [];
lb = [2,4];
ub = [3,4;7,2];
options=list("MaxIter", [1500], "CpuTime", [500], "Gradient", "OFF", "Hessian", "OFF");

//  !--error 10000 
// intfmincon: Expected a vector matrix for input argument ub at input #9, but got [2 2] instead.
// at line      49 of function Checkvector called by :  
// at line     316 of function intfmincon called by :  
// [x0pt,fopt,exitflag,gradient,hessian] = intfmincon(f,x0,intcon, A, b, Aeq, beq, lb, ub);
// at line      24 of exec file called by :    
// exec intfmincon_ub1.sce
 


[x0pt,fopt,exitflag,gradient,hessian] = intfmincon(f,x0,intcon, A, b, Aeq, beq, lb, ub);
