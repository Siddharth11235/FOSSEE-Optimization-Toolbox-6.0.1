// Example with log objective function, inequality constraints and non linear constraints

function y=fun(x)
    y=sum(log(x))
endfunction

x0 = repmat(1,1,3);
lb = repmat(0,1,3);
ub = repmat(10,1,3);

A=[-1,-5,-3;];
b=[-100]';

function [c,ceq]=nlc(x)
c = [- 0.5*log(x(1)) - 2.5*log(x(2)) - 1.5*log(x(3)) + 50];
ceq = [];
endfunction

[xopt,fopt,exitflag,output,lambda,gradient,hessian] = fmincon (fun, x0,A,b,[],[],lb,ub)
