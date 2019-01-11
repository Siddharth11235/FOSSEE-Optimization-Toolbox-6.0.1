// Check for the param to be a list
C = [2 0;
	-1 1;
	 0 2]
d = [1
	 0
    -1];
A = [10 -2;
	 -2 10];
b = [4
    -4];
param = 0;

//Error
//lsqlin: param should be a list 
//at line     147 of function lsqlin called by :  
//[xopt,resnorm,residual,exitflag,output,lambda] = lsqlin(C,d,A,b,[],[],[],[],[],0)

[xopt,resnorm,residual,exitflag,output,lambda] = lsqlin(C,d,A,b,[],[],[],[],[],param)

