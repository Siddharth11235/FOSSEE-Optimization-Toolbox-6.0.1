// Copyright (C) 2016 - IIT Bombay - FOSSEE
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
// Author: Harpreet Singh, Pranav Deshpande and Akshay Miterani
// Organization: FOSSEE, IIT Bombay
// Email: toolbox@scilab.in

#include <iomanip>
#include <fstream>
#include <iostream>
#include "CoinPragma.hpp"
#include "CoinTime.hpp"
#include "CoinError.hpp"

#include "BonOsiTMINLPInterface.hpp"
#include "BonIpoptSolver.hpp"
#include "QuadTMINLP.hpp"
#include "BonCbc.hpp"
#include "BonBonminSetup.hpp"

#include "BonOACutGenerator2.hpp"
#include "BonEcpCuts.hpp"
#include "BonOaNlpOptim.hpp"

extern  "C"
{
#include <api_scilab.h>
#include <Scierror.h>
#include <BOOL.h>
#include <localization.h>
#include <sciprint.h>
#include <stdlib.h>


const char fname[] = "solveintqp";
/* ==================================================================== */
int sci_solveintqp(scilabEnv env, int nin, scilabVar* in, int nopt, scilabOpt opt, int nout, scilabVar* out) 
{

  using namespace Ipopt;
  using namespace Bonmin;

	if (nin !=15) //Checking the input arguments
	{
        	Scierror(999, "%s: Wrong number of input arguments: %d expected.\n", fname, 15);
        	return STATUS_ERROR; 
	}
	
	if (nout !=3) //Checking the output arguments

	{
		Scierror(999, "%s: Wrong number of output argument(s): %d expected.\n", fname, 3);
		return 1;
	}
	

	// Input arguments
	double *QItems=NULL,*PItems=NULL, *intcon = NULL, *ConItems=NULL,*conUB=NULL,*conLB=NULL;
	double *varUB=NULL,*varLB=NULL,*init_guess=NULL,*options=NULL, *ifval=NULL;
	static int nVars = 0,nCons = 0, intconSize = 0;
	unsigned int temp1 = 0,temp2 = 0;
	wchar_t* ptr1;
	char bonmin_options_file[32];
	// Output arguments
	double  ObjVal = 0,iteration=0;	//double *fX = NULL, ObjVal = 0,iteration=0;
	int rstatus = 0;
	
	const double *fX = NULL;	//changed fX from double* to const double*

	////////// Manage the input arguments //////////


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

	//Number of variables constrained to be integers
	if (scilab_isInt32(env, in[2]) == 0 || scilab_isScalar(env, in[2]) == 0)
	{
    	Scierror(999, "%s: Wrong type for input argument #%d: An int expected.\n", fname, 3);
    	return 1;
	}

	scilab_getInteger32(env, in[2], &intconSize);

	//Q matrix from scilab
	if (scilab_isDouble(env, in[3]) == 0 || scilab_isMatrix2d(env, in[3]) == 0)
	{
    	Scierror(999, "%s: Wrong type for input argument #%d: A double matrix expected.\n", fname, 4);
   		return 1;
	}	
	

	scilab_getDoubleArray(env, in[3], &QItems);
	
	//P matrix from scilab
	if (scilab_isDouble(env, in[4]) == 0 || scilab_isMatrix2d(env, in[4]) == 0)
	{
    	Scierror(999, "%s: Wrong type for input argument #%d: A double matrix expected.\n", fname, 5);
   		return 1;
	}	

	scilab_getDoubleArray(env, in[4], &PItems);

	if (scilab_isDouble(env, in[5]) == 0 || scilab_isMatrix2d(env, in[5]) == 0)
	{
    	Scierror(999, "%s: Wrong type for input argument #%d: A double matrix expected.\n", fname, 6);
   		return 1;
	}	

	scilab_getDoubleArray(env, in[5], &intcon);

	if (nCons!=0)
	{
		//ConItems matrix from scilab
		if (scilab_isDouble(env, in[6]) == 0 || scilab_isMatrix2d(env, in[6]) == 0)
		{
    		Scierror(999, "%s: Wrong type for input argument #%d: A double matrix expected.\n", fname, 7);
   			return 1;
		}	
		
		scilab_getDoubleArray(env, in[6], &ConItems);

		//conLB matrix from scilab
		if (scilab_isDouble(env, in[7]) == 0 || scilab_isMatrix2d(env, in[7]) == 0)
		{
    		Scierror(999, "%s: Wrong type for input argument #%d: A double matrix expected.\n", fname, 8);
   			return 1;
		}	

		scilab_getDoubleArray(env, in[7], &conLB);

		//conUB matrix from scilab
		if (scilab_isDouble(env, in[8]) == 0 || scilab_isMatrix2d(env, in[8]) == 0)
		{
    		Scierror(999, "%s: Wrong type for input argument #%d: A double matrix expected.\n", fname, 9);
   			return 1;
		}	

		scilab_getDoubleArray(env, in[8], &conUB);
	}

	//varLB matrix from scilab
	if (scilab_isDouble(env, in[9]) == 0 || scilab_isMatrix2d(env, in[9]) == 0)
	{
		Scierror(999, "%s: Wrong type for input argument #%d: A double matrix expected.\n", fname, 10);
		return 1;
	}	
	
	scilab_getDoubleArray(env, in[9], &varLB);

	//varUB matrix from scilab
	if (scilab_isDouble(env, in[10]) == 0 || scilab_isMatrix2d(env, in[10]) == 0)
	{
		Scierror(999, "%s: Wrong type for input argument #%d: A double matrix expected.\n", fname, 11);
		return 1;
	}	
	
	scilab_getDoubleArray(env, in[10], &varUB);

	//Initial Value of variables from scilab
	if (scilab_isDouble(env, in[11]) == 0 || scilab_isMatrix2d(env, in[11]) == 0)
	{
		Scierror(999, "%s: Wrong type for input argument #%d: A double matrix expected.\n", fname, 12);
		return 1;
	}	
	
	scilab_getDoubleArray(env, in[11], &init_guess);

	if (scilab_isDouble(env, in[12]) == 0 || scilab_isMatrix2d(env, in[12]) == 0)
	{
    	Scierror(999, "%s: Wrong type for input argument #%d: A double matrix expected.\n", fname, 13);
   		return 1;
	}
	scilab_getDoubleArray(env, in[12], &options);
	
	if (scilab_isDouble(env, in[13]) == 0 || scilab_isMatrix2d(env, in[13]) == 0)
	{
    	Scierror(999, "%s: Wrong type for input argument #%d: A double matrix expected.\n", fname, 14);
   		return 1;
	}
	scilab_getDoubleArray(env, in[13], &ifval);



	if (scilab_isString(env, in[14]) == 0 || scilab_isScalar(env, in[14]) == 0)
	{
    	Scierror(999, "%s: Wrong type for input argument #%d: A string expected.\n", fname, 15);
    	return 1;
	}

    scilab_getString(env, in[14], &ptr1);
	int ret = wcstombs ( bonmin_options_file, ptr1, sizeof(bonmin_options_file) );
  

  
		
  SmartPtr<QuadTMINLP> tminlp = new QuadTMINLP(nVars,nCons,intconSize,QItems, PItems, intcon,ConItems,conLB,conUB,varLB,varUB,init_guess);

  BonminSetup bonmin;
  bonmin.initializeOptionsAndJournalist();
            
  // Here we can change the default value of some Bonmin or Ipopt option
  bonmin.options()->SetStringValue("mu_oracle","loqo");
  

  //Register an additional option
	if((int)ifval[0])
            bonmin.options()->SetNumericValue("bonmin.integer_tolerance", (options[0]));
    if((int)ifval[1])
            bonmin.options()->SetIntegerValue("bonmin.node_limit", (int)(options[1]));
    if((int)ifval[2])
            bonmin.options()->SetNumericValue("bonmin.time_limit", (options[2]));
    if((int)ifval[3])
            bonmin.options()->SetNumericValue("bonmin.allowable_gap", (options[3]));
    if((int)ifval[4])
            bonmin.options()->SetIntegerValue("bonmin.iteration_limit", (int)(options[4]));


  //Here we read the option file
  //if ( bonmin_options_file!=NULL )
  //  bonmin.readOptionsFile(bonmin_options_file);

  //Now initialize from tminlp
  bonmin.initialize(GetRawPtr(tminlp));
  
  //Set up done, now let's branch and bound
  try {
    Bab bb;
    bb(bonmin);//process parameter file using Ipopt and do branch and bound using Cbc
  }
  catch(TNLPSolver::UnsolvedError *E) {
    //There has been a failure to solve a problem with Ipopt.
    std::cerr<<"Ipopt has failed to solve a problem!"<<std::endl;
    Scierror(999, "\nIpopt has failed to solve the problem!\n");	//changed from sciprint to Scierror 
  }
  catch(OsiTMINLPInterface::SimpleError &E) {
    std::cerr<<E.className()<<"::"<<E.methodName()
	     <<std::endl
	     <<E.message()<<std::endl;
	  Scierror(999, "\nFailed to solve a problem!\n");	//changed from sciprint to Scierror
	}
  catch(CoinError &E) {
    std::cerr<<E.className()<<"::"<<E.methodName()
	     <<std::endl
	     <<E.message()<<std::endl;
	  Scierror(999, "\nFailed to solve a problem!\n");	//changed from sciprint to Scierror
	}
	rstatus=tminlp->returnStatus();
	if (rstatus >= 0 | rstatus <= 5){
		fX = tminlp->getX();
		ObjVal = tminlp->getObjVal();

		out[0] = scilab_createDoubleMatrix2d(env, 1, nVars, 0);
		scilab_setDoubleArray(env, out[0], fX);

		out[1] = scilab_createDouble(env, ObjVal);
		out[2] = scilab_createDouble(env, (double)rstatus);
		
	}
	else
	{
		out[0] = scilab_createDoubleMatrix2d(env, 0, 0, 0);
		scilab_setDoubleArray(env, out[0], fX);

		out[1] = scilab_createDouble(env, ObjVal);
		out[2] = scilab_createDouble(env, (double)rstatus);
		
		Scierror(999, "\nThe problem could not be solved!\n");	//changed call to Scierror instead of sciprint
  }

	// As the SmartPtrs go out of scope, the reference count
	// will be decremented and the objects will automatically
	// be deleted(No memory leakage). 
	
  return 0;
}
}

