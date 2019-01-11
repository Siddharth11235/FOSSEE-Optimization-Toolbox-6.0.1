// Check for the size of parameters
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

param = list("MaxIter");

//Error
//lsqlin: Size of parameters should be even
//at line      75 of function lsqnonneg called by :  
//[xopt,resnorm,residual,exitflag,output,lambda] = lsqnonneg(C,d,param)

[xopt,resnorm,residual,exitflag,output,lambda] = lsqnonneg(C,d,param)

