// Example with objective function and inequality constraints
function y=fun(x)
    y=-sum(exp(x))
endfunction

x0 = [repmat(1,1,20)];
A=[-1,-5,-3 repmat(0,1,17); -0.5,-2.5 -1.5 repmat(0,1,17);];
b=[-100 -50]';

lb = repmat(0,1,20);
ub = repmat(10,1,20);

[xopt,fopt,exitflag,output,lambda,gradient,hessian] = fmincon (fun, x0,A,b,[],[],lb,ub)
