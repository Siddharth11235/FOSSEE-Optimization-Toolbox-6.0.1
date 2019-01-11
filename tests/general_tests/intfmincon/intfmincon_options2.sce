
//Typing error in arguments to options

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
intcon=[1,2];	
//  !--error 999 
// Unknown string argument passed.
// at line     380 of function intfmincon called by :  
// [x,fval,exitflag,grad,hessian] =intfmincon(f,x0,intcon,A,b,Aeq,beq,lb,ub,nlc,options)
// at line      44 of exec file called by :    
// exec intfmincon_options2.sce

function [c,ceq]=nlc(x)
  c=[x(1)^2-1,x(1)^2+x(2)^2-1,x(3)^2-1];
  ceq=[x(1)^3-0.5,x(2)^2+x(3)^2-0.75];
endfunction
  
//Typing error: Expected "GradObj" instead of "GradientObj" 
options=list("MaxIter", [1500], "CpuTime", [500]);

[x,fval,exitflag,grad,hessian] =intfmincon(f,x0,intcon,A,b,Aeq,beq,lb,ub,nlc,options)
