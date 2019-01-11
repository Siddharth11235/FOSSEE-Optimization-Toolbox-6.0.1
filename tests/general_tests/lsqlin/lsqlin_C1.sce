// Check for elements in C and d
C = [2 0;
	-1 1;
	 0 2]
d = [1
	 0];
A = [10 -2;
	 -2 10];
b = [4
    -4];

//Error
//lsqlin: The number of rows in C must be equal the number of elements of d
//at line     207 of function lsqlin called by :  
//[xopt,resnorm,residual,exitflag,output,lambda] = lsqlin(C,d,A,b)

[xopt,resnorm,residual,exitflag,output,lambda] = lsqlin(C,d,A,b)

