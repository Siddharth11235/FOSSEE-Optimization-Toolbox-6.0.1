// Check for elements in A
C = [2 0;
	-1 1;
	 0 2]
d = [1
	 0
    -1];
A = [10 -2 0;
	 -2 10 0];
b = [4
    -4];

//Error
//lsqlin: The number of columns in A must be the same as the number of columns in C
//at line     213 of function lsqlin called by :  
//[xopt,resnorm,residual,exitflag,output,lambda] = lsqlin(C,d,A,b)

[xopt,resnorm,residual,exitflag,output,lambda] = lsqlin(C,d,A,b)

