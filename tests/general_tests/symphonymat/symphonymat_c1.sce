// Check for size of Objective Coefficients
// Objective function
c = [350*5,330*3,310*4,280*6,500,450,400,100];

// Lower Bound of variable
lb = repmat(0,1,8);

// Upper Bound of variables
ub = [repmat(1,1,4) repmat(%inf,1,4)];

// Constraint Matrix
Aeq = [5,3,4,6,1,1,1,1;
5*0.05,3*0.04,4*0.05,6*0.03,0.08,0.07,0.06,0.03;
5*0.03,3*0.03,4*0.04,6*0.04,0.06,0.07,0.08,0.09;]

beq = [ 25, 1.25, 1.25]

intcon = [1 2 3 4];

//Error
//Symphonymat: Objective Coefficients should be a column matrix
//at line     160 of function symphonymat called by :  
//[x,f,status,output] = symphonymat(c,intcon,[],[],Aeq,beq,lb,ub)

// Calling Symphony
[x,f,status,output] = symphonymat(c,intcon,[],[],Aeq,beq,lb,ub)

