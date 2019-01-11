// Infeasible problem
objCoef = -1 * [1 1]'
conMatrix = [-1 0; 0, -1; 1 1]
conLB = -1*[%inf %inf %inf ]
conUB = [-6 -6 11]
nbVar = 2;
nbCon = 3;
isInt = repmat(%f,1,nbVar)
LB = -1*[%inf %inf]
UB = [%inf %inf]

// Output
//Problem loaded into environment.
//Note: There is no limit on time.
//This problem is infeasible.

[xopt, fopt, exitflag, output] = symphony(nbVar,nbCon,objCoef,isInt,LB,UB,conMatrix,conLB,conUB);


