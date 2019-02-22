// Copyright (C) 2015 - IIT Bombay - FOSSEE
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
// Author: Guru Pradeep Reddy Bhanu Priya Sayal
// Organization: FOSSEE, IIT Bombay
// Email: toolbox@scilab.in




#include <iostream>
#include "OsiClpSolverInterface.hpp"
#include"OsiSolverInterface.hpp"

extern "C"{
#include <api_scilab.h>
#include <Scierror.h>
#include <localization.h>
#include <sciprint.h>
#include <stdlib.h>


const char fname[] = "rmps";
//Solver function
int sci_rmps(scilabEnv env, int nin, scilabVar* in, int nopt, scilabOpt opt, int nout, scilabVar* out) 
{
 

	//data declaration
	wchar_t* ptr1;                	//pointer to point to address of the filename
    double* options_;     
	int nIters = 0;              	//options to set maximum iterations 
	scilabVar in2 = NULL;





   	if (nin !=2) 
	{
        	Scierror(999, "%s: Wrong number of input arguments: %d expected.\n", fname, 2);
        	return STATUS_ERROR; 
	}
	
	if (nout !=6) //Checking the output arguments

	{
		Scierror(999, "%s: Wrong number of output argument(s): %d expected.\n", fname, 6);
		return 1;
	}
	////////// Manage the input argument //////////
    //Getting the MPS file path
	//Reading mps file
	if (scilab_isString(env, in[0]) == 0 || scilab_isScalar(env, in[0]) == 0)
	{
    	Scierror(999, "%s: Wrong type for input argument #%d: An int expected.\n", fname, 1);
    	return 1;
	}

    scilab_getString(env, in[0], &ptr1);
	
	
	int i = 0;

	char filename[32];
	int ret = wcstombs ( filename, ptr1, sizeof(filename) );


	
	
    //get options from scilab

    if (scilab_isList(env, in[1]) == 0)
    {
        Scierror(999, "%s: Wrong type for input argument #%d: A list expected.\n", fname, 2);
        return 1;
    }
	in2 = scilab_getListItem( env, in[1], 1);

	scilab_getInteger32(env, in2, &nIters);



	//creating a problem pointer using base class of OsiSolverInterface and
    //instantiate the object using derived class of ClpSolverInterface
    OsiSolverInterface* si = new OsiClpSolverInterface();

    //Read the MPS file
    si->readMps(filename);



    //setting options for maximum iterations
    si->setIntParam(OsiMaxNumIteration, nIters);

    //Solve the problem
    si->initialSolve();
  
    //Quering about the problem
    //get number of variables
    double numVars_;
    numVars_ = si->getNumCols();
  
    //get number of constraint equations
    double numCons_;
    numCons_ = si->getNumRows();
   
    //Output the solution to Scilab
    //get solution for x	//const r
    const double* xValue = si->getColSolution();
   
    //get objective value
    double objValue = si->getObjValue();

    //get Status value
    double status;
    if(si->isProvenOptimal())
    	status=0;
    else if(si->isProvenPrimalInfeasible())
    	status=1;
    else if(si->isProvenDualInfeasible())
        status=2;
    else if(si->isIterationLimitReached())
        status=3;
   	else if(si->isAbandoned())
        status=4;
   	else if(si->isPrimalObjectiveLimitReached())
        status=5;
   	else if(si->isDualObjectiveLimitReached())
        status=6;

    //get number of iterations
    double iterations = si->getIterationCount();

    //get reduced cost	//const r
    const double* Zl = si->getReducedCost();
   
    //get dual vector //const r	
    const double* dual = si->getRowPrice();
  
    //Create Output matrices
	out[0] = scilab_createDoubleMatrix2d(env, numVars_, 1, 0);
	out[4] = scilab_createDoubleMatrix2d(env, numVars_, 1, 0);
	out[5] = scilab_createDoubleMatrix2d(env, numCons_, 1, 0);


	
	scilab_setDoubleArray(env, out[0], xValue);
	out[1] = scilab_createDouble(env, objValue);
	out[2] = scilab_createDouble(env, status);
	out[3] = scilab_createDouble(env, iterations);
	scilab_setDoubleArray(env, out[4], Zl);
	scilab_setDoubleArray(env, out[5], dual);

	return 0;	
  }
}
