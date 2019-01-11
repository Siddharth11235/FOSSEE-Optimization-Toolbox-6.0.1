// Check for the input arguments
C = [1 1 1;
	1 1 0;
	0 1 1;
	1 0 0;
	0 0 1]
d = [89;
	67;
	53;
	35;
	20]

param = list();
x0 = [0 0];

//Error
//lsqnonneg: Unexpected number of input arguments : 4 provided while should be in the set of [2 3]
//at line      55 of function lsqnonneg called by :  
//[xopt,resnorm,residual,exitflag,output,lambda] = lsqnonneg(C,d,param,x0)

[xopt,resnorm,residual,exitflag,output,lambda] = lsqnonneg(C,d,param,x0)

