// Check if a user specifies coefficients of linear inequality contraints of the correct dimensions 

// Reference : Example 2 -1, Travelling salesman , Hamdy A. Taha. "Operations Research-An Introduction", 9E(2014))

// Objective function
c = [1000,10,17,15,20,1000,19,18,50,44,1000,22,45,40,20,1000]';

// Lower Bound of variable
lb = repmat(0,1,8);
// Upper Bound of variables
ub = repmat(1,1,16) ;

// Constraint Matrix
Aeq=[1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0;
     0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0;
     0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0;
     0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1;
     1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0;
     0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0;
     0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0;
     0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1;]

beq=repmat(1,1,8)

intcon = 1:1:16 ;

// Calling intlinprog
[x,f,status,output] = intlinprog(c,intcon,[],[],Aeq,beq,lb,ub)
// !--error 10000 
//intlinprog: The Lower Bound is not equal to the number of variables
//at line     153 of function cbcmatrixintlinprog called by :  
//at line     203 of function intlinprog called by :  
//[x,f,status,output] = intlinprog(c,intcon,[],[],Aeq,beq,lb,ub)
//at line      28 of exec file called by :    
//exec intlinprog_lb1.sce
