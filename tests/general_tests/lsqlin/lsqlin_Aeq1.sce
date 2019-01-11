// Check for elements in Aeq
 C = [2 0;
	 -1 1;
	  0 2]
 d = [1
 	 0
    -1];
 Aeq = [10 -2 0;
	  -2 10 0];
 beq = [4
     -4];


//Error
//lsqlin: The number of columns in Aeq must be the same as the number of columns in C
//at line     219 of function lsqlin called by :  
//[xopt,resnorm,residual,exitflag,output,lambda] = lsqlin(C,d,[],[],Aeq,beq)

[xopt,resnorm,residual,exitflag,output,lambda] = lsqlin(C,d,[],[],Aeq,beq)

