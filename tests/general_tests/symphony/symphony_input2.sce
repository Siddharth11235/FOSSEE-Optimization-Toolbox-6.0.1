// Check if the user provides more number of input arguments
// A basic case :

// Objective function
c = [350*5,330*3,310*4,280*6,500,450,400,100]';

// Lower Bound of variable
lb = repmat(0,8,1);

// Upper Bound of variables
ub = [repmat(1,4,1);repmat(%inf,4,1)];

// Constraint Matrix
A = [5,3,4,6,1,1,1,1;
5*0.05,3*0.04,4*0.05,6*0.03,0.08,0.07,0.06,0.03;
5*0.03,3*0.03,4*0.04,6*0.04,0.06,0.07,0.08,0.09;]

// Lower Bound of constrains
conlb = [ 25; 1.25; 1.25]

// Upper Bound of constrains
conub = [ 25; 1.25; 1.25]

// Row Matrix for telling symphony that the is integer or not
isInt = [repmat(%t,1,4) repmat(%f,1,4)];

// Calling Symphony
[x,f,status,output] = symphony(8,3,c,isInt,lb,ub,A,conlb,conub,1,[],[],[])

// Error
//Symphony: Unexpected number of input arguments : 13 provided while should be in the set [9 10 11]
//at line     158 of function symphony called by :  
//[x,f,status,output] = symphony(8,3,c,isInt,lb,ub,A,conlb,conub,1,[],[],[])
