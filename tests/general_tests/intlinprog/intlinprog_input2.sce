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

intcon = [4 5 6];

// Calling intlinprog
[x,f,status,output] = intlinprog(c,intcon,A,b,Aeq,beq,lb,ub,[],[])

// !--error 10000 
//intlinprog: Unexpected number of input arguments : 10 provided while should be in the set [4 6 8 9]
//at line     152 of function intlinprog called by :  
//[x,f,status,output] = intlinprog(c,intcon,A,b,Aeq,beq,lb,ub,[],[])
//at line      27 of exec file called by :    
//exec intlinprog_input2.sce
