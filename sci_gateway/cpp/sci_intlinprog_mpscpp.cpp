// MILP with CBC library, mps
// Finds the solution by using CBC Library
// Code Authors: Siddharth Agarwal


// For Branch and bound
#include "OsiSolverInterface.hpp"
#include "CbcModel.hpp"
#include "CbcCutGenerator.hpp"
#include "CbcHeuristicLocal.hpp"
#include "OsiClpSolverInterface.hpp"
extern "C" {
#include <api_scilab.h>
#include <Scierror.h>
#include <localization.h>
#include <sciprint.h>
#include <stdlib.h>

const char fname[] = "mpsintlinprog";
//Solver function
int sci_mpsintlinprog(scilabEnv env, int nin, scilabVar* in, int nopt, scilabOpt opt, int nout, scilabVar* out) 
{
    OsiClpSolverInterface solver;  
    
    // Path to the MPS file
    wchar_t* ptr1;
    // Options to set maximum iterations
    double *options;

    // Input - 1 or 2 arguments allowed.
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

    // Get the MPS File Path from Scilab
    if (scilab_isString(env, in[0]) == 0 || scilab_isScalar(env, in[0]) == 0)
	{
    	Scierror(999, "%s: Wrong type for input argument #%d: An int expected.\n", fname, 1);
    	return 1;
	}

    scilab_getString(env, in[0], &ptr1);

	char filename[32];
	int ret = wcstombs ( filename, ptr1, sizeof(filename) );
    
    // Receive the options for setting the maximum number of iterations etc.
    if (scilab_isDouble(env, in[1]) == 0 || scilab_isMatrix2d(env, in[1]) == 0)
	{
    	Scierror(999, "%s: Wrong type for input argument #%d: A double matrix expected.\n", fname, 2);
   		return 1;
	}
	scilab_getDoubleArray(env, in[1], &options);
    
    // Read the MPS file
    solver.readMps(filename);

    // Cbc Library used from here
    CbcModel model(solver);

    model.solver()->setHintParam(OsiDoReducePrint, true, OsiHintTry);
    
    if((int)options[0]!=0)
            model.setIntegerTolerance(options[0]);
    if((int)options[1]!=0)
            model.setMaximumNodes((int)options[1]); 
    if((int)options[2]!=0)
            model.setMaximumSeconds(options[2]);
    if((int)options[3]!=0)
            model.setAllowableGap(options[3]);

    model.branchAndBound();

    int nVars = model.getNumCols();
    int nCons = model.getNumRows();
    
    const double *val = model.getColSolution();

    
    //Output the solution to Scilab
    
    //get solution for x
    const double* xValue = model.getColSolution();	//added const

    //get objective value
    double objValue = model.getObjValue();

    //Output status
    double status_=-1;
    if(model.isProvenOptimal()){
        status_=0;
    }
    else if(model.isProvenInfeasible()){
        status_=1;
    }
    else if(model.isSolutionLimitReached()){
        status_=2;
    }
    else if(model. isNodeLimitReached()){
        status_=3;
    }
    else if(model.isAbandoned()){
        status_=4;
    }
    else if(model.isSecondsLimitReached()){
        status_=5;
    }
    else if(model.isContinuousUnbounded()){
        status_=6;
    }
    else if(model.isProvenDualInfeasible()){
        status_=7;
    }

    double nodeCount = model.getNodeCount();
    double nfps = model.numberIntegers();
    double U = model.getObjValue();
    double L = model.getBestPossibleObjValue();
    double iterCount = model.getIterationCount();

    out[0] = scilab_createDoubleMatrix2d(env, nVars, 1, 0);
	scilab_setDoubleArray(env, out[0], xValue);
	out[1] = scilab_createDouble(env, objValue);
	out[2] = scilab_createDouble(env, status_);
	out[3] = scilab_createDouble(env, nodeCount);
	out[4] = scilab_createDouble(env, nfps);
	out[5] = scilab_createDouble(env, L);
	out[6] = scilab_createDouble(env, U);
	out[7] = scilab_createDouble(env, iterCount);

    return 0;
}
}
