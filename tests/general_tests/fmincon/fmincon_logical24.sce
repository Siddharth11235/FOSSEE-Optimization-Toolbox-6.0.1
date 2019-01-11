// Example with objective function and inequality constraints
function y=fun(x)
    y=sum((sin(x)).^2 + (cos(x)).^2)
endfunction

x0 = [repmat(1,1,3)];
A=[-1,-5,-3; -0.5,-2.5 -1.5;];
b=[-100 -50]';
lb = repmat(0,1,3);

function [c,ceq]=nlc(x)
    c = [ -sum((sin(x)).^2 + (cos(x)).^2) + 1.5];
    ceq = [];
endfunction

[xopt,fopt,exitflag,output,lambda,gradient,hessian] = fmincon (fun, x0,A,b,[],[],lb,[],nlc)
