// Check if the user gives different parameter other than predefined
//Find x in R^6 such that:

Aeq= [1,-1,1,0,3,1;
-1,0,-3,-4,5,6;
2,5,3,0,1,0];
beq=[1; 2; 3];
A= [0,1,0,1,2,-1;
-1,0,2,1,1,0];
b = [-1; 2.5];
lb=[-1000; -10000; 0; -1000; -1000; -1000];
ub=[10000; 100; 1.5; 100; 100; 1000];
x0 = repmat(0,6,1);
param = list("MaxIter", 300, "Time", 100);
f=[1; 2; 3; 4; 5; 6]; H=eye(6,6);
x0 = repmat(0,6,1);

// Error
//quadprogmat: Unrecognized parameter name 'Time'.
//at line     170 of function quadprogmat called by :  
//[xopt,fopt,exitflag,output,lambda]=quadprogmat(H,f,A,b,Aeq,beq,lb,ub,[],param)

[xopt,fopt,exitflag,output,lambda]=quadprogmat(H,f,A,b,Aeq,beq,lb,ub,[],param)


