// An example with equality constraints, variable bounds and options to set

// Objective function
c = [350*5,330*3,310*4,280*6,500,450,400,100]';

// Lower Bound of variable
lb = repmat(0,1,8)';

// Upper Bound of variables
ub = [repmat(1,1,4) repmat(%inf,1,4)]';

// Constraint Matrix
Aeq = [5,3,4,6,1,1,1,1;
5*0.05,3*0.04,4*0.05,6*0.03,0.08,0.07,0.06,0.03;
5*0.03,3*0.03,4*0.04,6*0.04,0.06,0.07,0.08,0.09;]

beq = [ 25, 1.25, 1.25;]'

intcon = [1 2 3 4 4];

options = list("time_limit",250);

//Output
//setting of double parameter function executed successfully
//Problem loaded into environment.
//
//Note: Time limit has been set to 250.000000.
//
//An optimal solution has been found.
// 
//    0.  
// 
//   Iterations: 1
// 
// output   
// 
//    227.  
// 
// status   
// 
//    8495.  
// 
// f   
// 
//    1.    
//    1.    
//    0.    
//    1.    
//    7.25  
//    0.    
//    0.25  
//    3.5   
// 
// x  

// Calling Symphony
[x,f,status,output] = symphonymat(c,intcon,[],[],Aeq,beq,lb,ub,options)
disp("x",x,"f",f,"status",status,"output",output);

