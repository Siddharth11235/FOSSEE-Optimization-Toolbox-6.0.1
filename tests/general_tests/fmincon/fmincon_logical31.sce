// Example with objective function and inequality constraints
function y=fun(x)
    y=sum(1/exp(x))
endfunction

x0 = [repmat(1,1,3)];
A=[-1,-5,-3;];
b=[-100];
lb = repmat(0,1,3);

//Nonlinear constraints
function [c,ceq]=nlc(x)
    c = [ sum(log(x)) - 10];
    ceq = [];
endfunction

[xopt,fopt,exitflag,output,lambda,gradient,hessian] = fmincon (fun, x0,A,b,[],[],lb,[],nlc)
