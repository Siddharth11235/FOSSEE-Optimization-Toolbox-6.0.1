// Check for elements in A
c=[-1,-1/3]'
A=[1,1;1,1/4;1,-1;-1/4,-1;-1,-1;-1,1]
b=[2,1,2,1,-1,2]
Aeq=[1,1/4]
beq=[1/2]

//Error
//linprog: The number of columns in A must be the same as the number of elements of c
//at line     113 of function matrix_linprog called by :  
//at line     169 of function linprog called by :  
//[xopt,fopt,exitflag,output,lambda]=linprog(c, b, b, Aeq, beq)
//at line      30 of exec file called by :    
//exec linprog_A1.sce

[xopt,fopt,exitflag,output,lambda]=linprog(c, b, b, Aeq, beq)


