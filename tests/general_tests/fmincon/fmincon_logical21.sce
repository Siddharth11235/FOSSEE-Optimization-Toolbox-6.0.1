// Example with log objective function, inequality constraints

function y=fun(x)
   y = -prod(log(x))
endfunction

x0 = repmat(1,1,20);
lb = repmat(0,1,20);

A=[-1,-5,-3 repmat(0,1,17); -0.5,-2.5 -1.5 repmat(0,1,17);];
b=[-100 -50]';

function [c,ceq]=nlc(x)
    c = [ sum(log(x)) + 1];
    ceq = [];
endfunction

[xopt,fopt,exitflag,output,lambda,gradient,hessian] = fmincon (fun, x0,A,b,[],[],lb,[],nlc)
