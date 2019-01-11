// Infeasible problem
C = -1 * [1 1]'
A = [-1 0; 0, -1; 1 1]
b = [-6 -6 11]

//Output
//Problem loaded into environment.
//Note: There is no limit on time.
//This problem is infeasible.

[xopt, fopt, exitflag, output] = symphonymat(C,1,A,b);


