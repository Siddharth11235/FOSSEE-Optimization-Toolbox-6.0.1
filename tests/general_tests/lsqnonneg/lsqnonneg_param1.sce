// Check for the parameters to be a list
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

param = 0;

//Error
//lsqnonneg: param should be a list 
//at line      69 of function lsqnonneg called by :  
//[xopt,resnorm,residual,exitflag,output,lambda] = lsqnonneg(C,d,param)

[xopt,resnorm,residual,exitflag,output,lambda] = lsqnonneg(C,d,param)

