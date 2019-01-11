// Check if a user specifies coefficients of linear inequality contraints of the correct dimensions 

// Reference : Example 1-3, Integer Linear Programming, Hamdy A. Taha. "Operations Research-An Introduction", 9E(2014))

// Objective function
c = [0.25,0.21,0.22,16,25,18]';

// Lower Bound of variable
lb = repmat(0,1,6);

// Upper Bound of variables
ub = [repmat(%inf,1,3) repmat(1,1,3)];

// Constraint Matrix
A = [1, 0, 0, -200, 0, 0;
0, 1, 0, 0, -200, 0;
0, 0, 1, 0, 0, -200]

b=[0, 0, 0]

Aeq = [1, 1, 1, 0, 0, 0]

beq = [ 200]

//Integer constriants
intcon = [4 5 6];

options="maxiter=500"

// Calling intlinprog
[x,f,status,output] = intlinprog(c,intcon,A,b,Aeq,beq,lb,ub,options)

// !--error 10000 
//intlinprog: Options should be a list 
//at line     164 of function cbcmatrixintlinprog called by :  
//at line     203 of function intlinprog called by :  
//[x,f,status,output] = intlinprog(c,intcon,A,b,Aeq,beq,lb,ub,options)
//at line      28 of exec file called by :    
//exec intlinprog_matrix_param1.sce
