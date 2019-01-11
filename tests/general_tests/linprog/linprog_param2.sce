// Check for the param to be even in number
c=[-1,-1/3]'
A=[1,1;1,1/4;1,-1;-1/4,-1;-1,-1;-1,1]
b=[2,1,2,1,-1,2]
Aeq=[1,1/4]
beq=[1/2]
lb=[-1,-0.5]
ub=[1.5,1.25]
params = list("maxiter")

//Error
//linprog: Size of parameters should be even
//at line      91 of function matrix_linprog called by :  
//at line     169 of function linprog called by :  
//[xopt,fopt,exitflag,output,lambda]=linprog(c, A, b, Aeq, beq, lb, ub,params)
//at line      13 of exec file called by :    
//exec lsqlin_param2.sce

[xopt,fopt,exitflag,output,lambda]=linprog(c, A, b, Aeq, beq, lb, ub,params)
