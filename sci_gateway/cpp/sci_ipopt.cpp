// Copyright (C) 2015 - IIT Bombay - FOSSEE
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
// Author: Harpreet Singh, Sai Kiran, Keyur Joshi, Iswarya
// Organization: FOSSEE, IIT Bombay
// Email: toolbox@scilab.in


#include "IpIpoptApplication.hpp"
#include "IpSolveStatistics.hpp"
#include "QuadNLP.hpp"

extern "C"{
#include <api_scilab.h>
#include <Scierror.h>
#include <BOOL.h>
#include <localization.h>
#include <sciprint.h>

const char fname[] = "solveqp";
/* ==================================================================== */
int sci_solveqp(scilabEnv env, int nin, scilabVar* in, int nopt, scilabOpt opt, int nout, scilabVar* out) 
{
	using namespace Ipopt;

	if (nin !=11) 
	{
        	Scierror(999, "%s: Wrong number of input arguments: %d expected.\n", fname, 11);
        	return STATUS_ERROR; 
	}
	
	if (nout !=7) //Checking the output arguments

	{
		Scierror(999, "%s: Wrong number of output argument(s): %d expected.\n", fname, 7);
		return 1;
	}
	
	// Error management variable

	// Input arguments
	double *QItems=NULL,*PItems=NULL,*conMatrix=NULL,*conUB=NULL,*conLB=NULL;
	double *varUB=NULL,*varLB=NULL,*init_guess=NULL;
	static int nVars = 0,nCons = 0;
	unsigned int iret = 0;

	scilabVar temp1 = NULL;
	scilabVar temp2 = NULL;


	// Output arguments
	const double *fX = NULL, *Zl=NULL, *Zu=NULL, *Lambda=NULL;
    double ObjVal=0,iteration=0;
	int rstatus = 0;

	////////// Manage the input argument //////////
	
	//Number of Variables
	if (scilab_isInt32(env, in[0]) == 0 || scilab_isScalar(env, in[0]) == 0)
	{
    	Scierror(999, "%s: Wrong type for input argument #%d: An int expected.\n", fname, 1);
    	return 1;
	}

	

	scilab_getInteger32(env, in[0], &nVars);

	//Number of Constraints
	if (scilab_isInt32(env, in[1]) == 0 || scilab_isScalar(env, in[1]) == 0)
	{
    	Scierror(999, "%s: Wrong type for input argument #%d: An int expected.\n", fname, 2);
    	return 1;
	}

	scilab_getInteger32(env, in[1], &nCons);

	//Q matrix from scilab
	if (scilab_isDouble(env, in[2]) == 0 || scilab_isMatrix2d(env, in[2]) == 0)
	{
    	Scierror(999, "%s: Wrong type for input argument #%d: A double matrix expected.\n", fname, 3);
   		return 1;
	}	
	

	scilab_getDoubleArray(env, in[2], &QItems);
	
	//P matrix from scilab
	if (scilab_isDouble(env, in[3]) == 0 || scilab_isMatrix2d(env, in[3]) == 0)
	{
    	Scierror(999, "%s: Wrong type for input argument #%d: A double matrix expected.\n", fname, 4);
   		return 1;
	}	
	

	scilab_getDoubleArray(env, in[3], &PItems);

	if (nCons!=0)
	{
		//conMatrix matrix from scilab
		if (scilab_isDouble(env, in[4]) == 0 || scilab_isMatrix2d(env, in[4]) == 0)
		{
    		Scierror(999, "%s: Wrong type for input argument #%d: A double matrix expected.\n", fname, 5);
   			return 1;
		}	
		
		scilab_getDoubleArray(env, in[4], &conMatrix);

		//conLB matrix from scilab
		if (scilab_isDouble(env, in[5]) == 0 || scilab_isMatrix2d(env, in[5]) == 0)
		{
    		Scierror(999, "%s: Wrong type for input argument #%d: A double matrix expected.\n", fname, 6);
   			return 1;
		}	
		

		scilab_getDoubleArray(env, in[5], &conLB);

		//conUB matrix from scilab
		if (scilab_isDouble(env, in[6]) == 0 || scilab_isMatrix2d(env, in[6]) == 0)
		{
    		Scierror(999, "%s: Wrong type for input argument #%d: A double matrix expected.\n", fname, 7);
   			return 1;
		}	
		
		scilab_getDoubleArray(env, in[6], &conUB);
	}

	//varLB matrix from scilab
	
	if (scilab_isDouble(env, in[7]) == 0 || scilab_isMatrix2d(env, in[7]) == 0)
	{
		Scierror(999, "%s: Wrong type for input argument #%d: A double matrix expected.\n", fname, 8);
		return 1;
	}	
	
	scilab_getDoubleArray(env, in[7], &varLB);


	//varUB matrix from scilab
	if (scilab_isDouble(env, in[8]) == 0 || scilab_isMatrix2d(env, in[8]) == 0)
	{
		Scierror(999, "%s: Wrong type for input argument #%d: A double matrix expected.\n", fname, 9);
		return 1;
	}	
	
	scilab_getDoubleArray(env, in[8], &varUB);

	//Initial Value of variables from scilab
	
	if (scilab_isDouble(env, in[9]) == 0 || scilab_isMatrix2d(env, in[9]) == 0)
	{
		Scierror(999, "%s: Wrong type for input argument #%d: A double matrix expected.\n", fname, 10);
		return 1;
	}	
	
	scilab_getDoubleArray(env, in[9], &init_guess);

	//Getting the parameters


	if (scilab_isList(env, in[10]) == 0)
    {
        Scierror(999, "%s: Wrong type for input argument #%d: A list expected.\n", fname, 11);
        return 1;
    }
	temp1 = scilab_getListItem( env, in[10], 1);
	temp2 = scilab_getListItem( env, in[10], 3);
	

	int nIters = 0,cpuTime = 0;

	scilab_getInteger32(env, temp1, &nIters);
	scilab_getInteger32(env, temp2, &cpuTime);

	

	sciprint("nIters: %d\n",nIters);
	sciprint("CpuTime: %d\n", cpuTime);

	// Starting Ipopt

	SmartPtr<QuadNLP> Prob = 
	new QuadNLP(nVars,nCons,QItems,PItems,conMatrix,conUB,conLB,varUB,varLB,init_guess);

	SmartPtr<IpoptApplication> app = IpoptApplicationFactory();

	////////// Managing the parameters //////////

	app->Options()->SetNumericValue("tol", 1e-7);
	app->Options()->SetIntegerValue("max_iter", 300);
	app->Options()->SetNumericValue("max_cpu_time", 100);
	app->Options()->SetStringValue("mu_strategy", "adaptive");
	// Indicates whether all equality constraints are linear 
	app->Options()->SetStringValue("jac_c_constant", "yes");
	// Indicates whether all inequality constraints are linear 
	app->Options()->SetStringValue("jac_d_constant", "yes");	
	// Indicates whether the problem is a quadratic problem 
	app->Options()->SetStringValue("hessian_constant", "yes");

	///////// Initialize the IpoptApplication and process the options /////////
	ApplicationReturnStatus status;
 	status = app->Initialize();
	if (status != Solve_Succeeded) {
	  	sciprint("\n*** Error during initialization!\n");
   	 return (int) status;
 	 }
	 // Ask Ipopt to solve the problem
	
	 status = app->OptimizeTNLP((SmartPtr<TNLP>&)Prob);

	rstatus = Prob->returnStatus();

	////////// Manage the output argument //////////

	

	if (rstatus >= 0 | rstatus <= 7){
		fX = Prob->getX();
		ObjVal = Prob->getObjVal();
		iteration = (double)app->Statistics()->IterationCount();


			
		out[0] = scilab_createDoubleMatrix2d(env, 1, nVars, 0);
		scilab_setDoubleArray(env, out[0], fX);
		out[1] = scilab_createDouble(env, ObjVal);
		out[2] = scilab_createDouble(env, rstatus);
		out[3] = scilab_createDouble(env, iteration);
	}

	else
	{
		out[0] = scilab_createDoubleMatrix2d(env, 0, 0, 0);
		scilab_setDoubleArray(env, out[0], fX);

		out[1] = scilab_createDouble(env, ObjVal);
		out[2] = scilab_createDouble(env, rstatus);
		out[3] = scilab_createDouble(env, iteration);
	}


	if(rstatus == 0){
	
		Zl = Prob->getZl();
		Zu = Prob->getZu();
		Lambda = Prob->getLambda();

		out[4] = scilab_createDoubleMatrix2d(env, 1, nVars, 0);
		scilab_setDoubleArray(env, out[4], Zl);
	
		out[5] = scilab_createDoubleMatrix2d(env, 1, nVars, 0);
		scilab_setDoubleArray(env, out[5], Zu);

		out[6] = scilab_createDoubleMatrix2d(env, 1, nCons, 0);
		scilab_setDoubleArray(env, out[5], Lambda);

	}

	else{

		out[4] = scilab_createDoubleMatrix2d(env, 0, 0, 0);
		scilab_setDoubleArray(env, out[4], Zl);
		
		out[5] = scilab_createDoubleMatrix2d(env, 0, 0, 0);
		scilab_setDoubleArray(env, out[5], Zu);

		out[6] = scilab_createDoubleMatrix2d(env, 0, 0, 0);
		scilab_setDoubleArray(env, out[6], Lambda);
	}
	// As the SmartPtrs go out of scope, the reference count
	// will be decremented and the objects will automatically
	// be deleted.

	return 0;
	}
}
