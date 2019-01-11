// Check for elements in b
C = [2 0;
	 -1 1;
	  0 2]
d = [1
 	 0
    -1];
A = [10 -2;
	  -2 10];
b = [-%inf -%inf];

//Error
//lsqlin: Value of b can not be negative infinity
//at line     286 of function lsqlin called by :  
//[xopt,resnorm,residual,exitflag,output,lambda] = lsqlin(C,d,A,b)

[xopt,resnorm,residual,exitflag,output,lambda] = lsqlin(C,d,A,b)

