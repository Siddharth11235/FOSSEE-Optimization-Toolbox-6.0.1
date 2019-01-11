// Check for the size of C and d
C = [1 1 1;
	1 1 0;
	0 1 1;
	1 0 0;
	0 0 1]
d = [89;
	67;
	53;
	35]

// Error
//lsqlin: The number of rows in C must be equal the number of elements of d
//at line     106 of function lsqnonneg called by :  
// [xopt,resnorm,residual,exitflag,output,lambda] = lsqnonneg(C,d)

 [xopt,resnorm,residual,exitflag,output,lambda] = lsqnonneg(C,d)

