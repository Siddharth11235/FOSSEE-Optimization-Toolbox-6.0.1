
//Incompatibility between user defined gradient function and dimensions of the starting point x0

function y=f(x)
  y=x(1)*x(2)+x(2)*x(3);
endfunction
   
x0=[1,1,1];
A=[];
b=[];
Aeq=[];
beq=[];
lb=[0 0.2,-%inf];
ub=[0.6 %inf,1];
  	
//Error
//fmincon: Gradient function of Objective and x0 did not match 
//at line     606 of function fmincon called by :  
//fmincon(f,x0,A,b,Aeq,beq,lb,ub,nlc,options)
//at line      44 of exec file called by :    
//exec fmincon_grad1.sce
	  
function [c,ceq]=nlc(x)
  c=[x(1)^2-1,x(1)^2+x(2)^2-1,x(3)^2-1];
  ceq=[x(1)^3-0.5,x(2)^2+x(3)^2-0.75];
endfunction
  	
//x(4) is invalid here	
function y= fGrad(x)
  y= [x(2),x(1)+x(3),x(4)];
endfunction
  	  
function y= lHess(x,obj,lambda)
  y= obj*[0,1,0;1,0,1;0,1,0] + lambda(1)*[2,0,0;0,0,0;0,0,0] + lambda(2)*[2,0,0;0,2,0;0,0,0] +lambda(3)*[0,0,0;0,0,0;0,0,2] + lambda(4)*[6*x(1),0,0;0,0,0;0,0,0] + lambda(5)*[0,0,0;0,2,0;0,0,2];
endfunction
  
function [cg,ceqg] = cGrad(x)
  cg = [2*x(1),0,0;2*x(1),2*x(2),0;0,0,2*x(3)];
  ceqg = [3*x(1)^2,0,0;0,2*x(2),2*x(3)];
endfunction
  
options=list("MaxIter", [1500], "CpuTime", [500], "GradObj", fGrad, "Hessian", lHess,"GradCon",cGrad);

[x,fval,exitflag,output,lambda,grad,hessian] =fmincon(f,x0,A,b,Aeq,beq,lb,ub,nlc,options)
