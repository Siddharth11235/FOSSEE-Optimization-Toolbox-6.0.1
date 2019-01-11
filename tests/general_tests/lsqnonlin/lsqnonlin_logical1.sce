function [y,dy] = testmyfun(x)
	km = [1:10]';
	y = 2 + 2*km-exp(km*x(1))-exp(km*x(2));
endfunction

x0 = [0.2 0.2]'

options = list("GradObj","off")

[x,resnorm,residual] = lsqnonlin(testmyfun,x0,[],[],options)
