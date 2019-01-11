//Find x in R^6 such that:
// Check for the Upper Bound of constraints is which should be equal to the number of constraints
A= [1,-1,1,0,3,1;
-1,0,-3,-4,5,6;
2,5,3,0,1,0
0,1,0,1,2,-1;
-1,0,2,1,1,0];
conLB=[1;2;3;-%inf;-%inf];
conUB = [1;2;3;-1];
lb=[-1000;-10000; 0; -1000; -1000; -1000];
ub=[10000; 100; 1.5; 100; 100; 1000];
//and minimize 0.5*x'*H*x + f'*x with
f=[1; 2; 3; 4; 5; 6]; H=eye(6,6);
nbVar = 6;
nbCon = 5;
x0 = repmat(0,nbVar,1);
param = list("MaxIter", 300, "CpuTime", 100);

//Error
//quadprog: The Upper Bound of constraints is not equal to the number of constraints
//at line     221 of function quadprog called by :  
//[xopt,fopt,exitflag,output,lambda]=quadprog(nbVar,nbCon,Q,p,lb,ub,conMatrix,conLB,conUB,x0,param)

[xopt,fopt,exitflag,output,lambda]=quadprog(nbVar,nbCon,H,f,lb,ub,A,conLB,conUB,x0,param)

