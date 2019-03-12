// Copyright (C) 2015 - IIT Bombay - FOSSEE
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
// Author: R.Vidyadhar & Vignesh Kannan
// Organization: FOSSEE, IIT Bombay
// Email: toolbox@scilab.in



#include "IpIpoptApplication.hpp"
#include "minuncNLP.hpp"
#include <IpSolveStatistics.hpp>

extern "C"
{
#include <api_scilab.h>
#include <Scierror.h>
#include <BOOL.h>
#include <localization.h>
#include <sciprint.h>
#include <iostream>
#include <wchar.h>


using namespace std;

//Solver function
 const char fname[] = "solveminuncp";
/* ==================================================================== */
int sci_solveminuncp(scilabEnv env, int nin, scilabVar* in, int nopt, scilabOpt opt, int nout, scilabVar* out) 
{

	using namespace Ipopt;



	//Function pointers, input matrix(Starting point) pointer, flag variable 
	wchar_t* funName = NULL;
	wchar_t* gradhesptr=NULL;
	double* x0ptr=NULL;
	int flag1,flag2;
        

     // Input arguments
	static unsigned int nVars = 0,nCons = 0;
	int x0_rows, x0_cols;

		
	
	// Output arguments
	double ObjVal=0,iteration=0,cpuTime=0,fobj_eval=0;
	double dual_inf, constr_viol, complementarity, kkt_error;
	const double *fX = NULL, *fGrad=  NULL;
	const double *fHess=  NULL;
	int rstatus = 0;
	int int_fobj_eval, int_constr_eval, int_fobj_grad_eval, int_constr_jac_eval, int_hess_eval;


	if (nin !=8)  //Checking the input arguments
	{
        	Scierror(999, "%s: Wrong number of input arguments: %d expected.\n", fname, 8);
        	return STATUS_ERROR; 
	}
	
	if (nout !=1) //Checking the output arguments

	{
		Scierror(999, "%s: Wrong number of output argument(s): %d expected.\n", fname, 9);
		return 1;
	}
	

	////////// Manage the input argument //////////
	
	//Objective Function

	

	if (scilab_isString(env, in[0]) == 0 || scilab_isScalar(env, in[0]) == 0)
	{
    	Scierror(999, "%s: Wrong type for input argument #%d: A function expected.\n", fname, 1);
   		return 1;
	}	

	scilab_getString(env, in[0], &funName);



 	//Function for gradient and hessian
	if (scilab_isString(env, in[1]) == 0 || scilab_isScalar(env, in[1]) == 0)
	{
    	Scierror(999, "%s: Wrong type for input argument #%d: A function expected.\n", fname, 2);
   		return 1;
	}	

	scilab_getString(env, in[1], &gradhesptr);
	
	//Flag for Gradient from Scilab


	if (scilab_isInt32(env, in[2]) == 0 || scilab_isScalar(env, in[2]) == 0)
	{
    	Scierror(999, "%s: Wrong type for input argument #%d: An int expected.\n", fname, 3);
    	return 1;
	}

	scilab_getInteger32(env, in[2], &flag1);

	
	//Flag for Hessian from Scilab
	if (scilab_isInt32(env, in[4]) == 0 || scilab_isScalar(env, in[4]) == 0)
	{
    	Scierror(999, "%s: Wrong type for input argument #%d: An int expected.\n", fname, 5);
    	return 1;
	}

	scilab_getInteger32(env, in[4], &flag2);


	//x0(starting point) matrix from scilab
	if (scilab_isDouble(env, in[6]) == 0 || scilab_isMatrix2d(env, in[6]) == 0)
	{
		Scierror(999, "%s: Wrong type for input argument #%d: A double matrix expected.\n", fname, 7);
		return 1;
	}
	
	scilab_getDoubleArray(env, in[6], &x0ptr);
	int size1 = scilab_getDim2d(env, in[6], &x0_rows, &x0_cols);

	//Getting number of iterations
	if (scilab_isList(env, in[7]) == 0)
    {
        Scierror(999, "%s: Wrong type for input argument #%d: A list expected.\n", fname, 8);
        return 1;
    }
	scilabVar temp1 = scilab_getListItem( env, in[7], 1);
	scilabVar temp2 = scilab_getListItem( env, in[7], 3);
	

	double nIters = 0,cpu_Time = 0;

	scilab_getDouble(env, temp1, &nIters);
	scilab_getDouble(env, temp2, &cpu_Time);

	int maxIters = (int)nIters;
	int cpu_time = (int)cpu_Time;
	

    //Initialization of parameters
	nVars=x0_cols;
	nCons=0;

	

    out[0] = scilab_createDouble(env, 0);
    //Starting Ipopt


	SmartPtr<minuncNLP> Prob = new minuncNLP(env, in, nVars, nCons, x0ptr, flag1, flag2);
	SmartPtr<IpoptApplication> app = IpoptApplicationFactory();
	
	////////// Managing the parameters //////////

	app->Options()->SetNumericValue("tol", 1e-7);
	app->Options()->SetIntegerValue("max_iter", nIters);
	app->Options()->SetNumericValue("max_cpu_time", cpu_time);
	
	///////// Initialize the IpoptApplication and process the options /////////
	ApplicationReturnStatus status;
 	status = app->Initialize();
	
	if (status != Solve_Succeeded) 
	{
	  	sciprint("\n*** Error during initialization!\n");
   		return (int) status;
 	 }
	 // Ask Ipopt to solve the problem
	
	status = app->OptimizeTNLP((SmartPtr<TNLP>&)Prob);
	 sciprint("\Solved\n");
	 cpuTime = app->Statistics()->TotalCPUTime();
	

	 app->Statistics()->NumberOfEvaluations(int_fobj_eval, int_constr_eval, int_fobj_grad_eval, int_constr_jac_eval, int_hess_eval);
	 
	 app->Statistics()->Infeasibilities(dual_inf, constr_viol, complementarity, kkt_error);
	 
	 rstatus = Prob->returnStatus();

	////////// Manage the output argument //////////



/* 	fX = Prob->getX();
	fGrad = Prob->getGrad();
	fHess = Prob->getHess();
	ObjVal = Prob->getObjVal();
	iteration = (double)app->Statistics()->IterationCount();
	fobj_eval  = (double)int_fobj_eval;
	

	out[0] = scilab_createDoubleMatrix2d(env, 1, nVars, 0);
	scilab_setDoubleArray(env, out[0], fX);

	out[1] = scilab_createDouble(env, ObjVal);

	out[2] = scilab_createDouble(env, rstatus);
	out[3] = scilab_createDouble(env, iteration);
	out[4] = scilab_createDouble(env, cpuTime);

	out[5] = scilab_createDouble(env, fobj_eval);
	
	out[6] = scilab_createDouble(env, dual_inf);
		
	out[7] = scilab_createDoubleMatrix2d(env, 1, nVars, 0);
	scilab_setDoubleArray(env, out[7], fGrad);

	out[8] = scilab_createDoubleMatrix2d(env, 1, nVars*nVars, 0);
	scilab_setDoubleArray(env, out[8], fHess);
	
	// As the SmartPtrs go out of scope, the reference count
	// will be decremented and the objects will automatically
	// be deleted.
*/
	return 0;
}
}
