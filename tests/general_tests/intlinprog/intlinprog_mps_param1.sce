//Primal infeasible mps file

//Reference : enlight9.mps.gz problem file,http://miplib.zib.de/miplib2010.php

options=5000

[xopt,fopt,status,output]=intlinprog("enlight9.mps",options)
//
// !--error 999 
//Unknown string argument passed.
//at line      31 of function cbcmpsintlinprog called by :  
//at line     220 of function intlinprog called by :  
//[xopt,fopt,status,output]=intlinprog("enlight9.mps",options)
//at line       7 of exec file called by :    
//exec intlinprog_param1.sce
