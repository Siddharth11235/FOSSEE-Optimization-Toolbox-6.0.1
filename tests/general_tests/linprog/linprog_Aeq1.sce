// Check for elements in Aeq
c=[-1,-1/3]'
A=[1,1;1,1/4;1,-1;-1/4,-1;-1,-1;-1,1]
b=[2,1,2,1,-1,2]
Aeq=[1,1/4]
beq=[1/2]

//Error
//linprog: The number of columns in Aeq must be the same as the number of elements of c
//at line     119 of function matrix_linprog called by :  
//at line     169 of function linprog called by :  
//[xopt,fopt,exitflag,output,lambda]=linprog(c, A, b, beq, beq)
//at line      16 of exec file called by :    
//exec linprog_Aeq1.sce

[xopt,fopt,exitflag,output,lambda]=linprog(c, A, b, beq, beq)


