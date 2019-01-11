// Check for the correct name of param
// An example with inequality constraints
c=[-1,-1/3]'
A=[1,1;1,1/4;1,-1;-1/4,-1;-1,-1;-1,1]
b=[2,1,2,1,-1,2]
Aeq=[1,1/4]
beq=[1/2]
lb=[-1,-0.5]
ub=[1.5,1.25]
params = list("iter",20)

//Error
//linprog: Unrecognized parameter name 'iter'.
//at line     103 of function matrix_linprog called by :  
//at line     169 of function linprog called by :  
//[xopt,fopt,exitflag,output,lambda]=linprog(c, A, b, Aeq, beq, lb, ub,params)
//at line      34 of exec file called by :    
//exec lsqlin_param3.sce

[xopt,fopt,exitflag,output,lambda]=linprog(c, A, b, Aeq, beq, lb, ub,params)

