// An example with inequality and equality constraints
c=[-1,-1/3]'
A=[1,1;1,1/4;1,-1;-1/4,-1;-1,-1;-1,1]
b=[2,1,2,1,-1,2]
Aeq=[1,1/4]
beq=[1/2]

//Error
//linprog: Unexpected number of input arguments : 9 provided while should be in the set of [3 5 7 8]
//at line     141 of function linprog called by :  
//[xopt,fopt,exitflag,output,lambda]=linprog(c, A, b, Aeq, beq,[],[],[],[])
//at line      15 of exec file called by :    
//exec linprog_input2.sce

[xopt,fopt,exitflag,output,lambda]=linprog(c, A, b, Aeq, beq,[],[],[],[])


