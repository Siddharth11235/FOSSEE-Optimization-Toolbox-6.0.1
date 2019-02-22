// MILP with CBC library, Matrix
// Code Authors: Akshay Miterani and Pranav Deshpande



// For Branch and bound
#include "OsiSolverInterface.hpp"
#include "CbcModel.hpp"
#include "CbcCutGenerator.hpp"
#include "CbcHeuristicLocal.hpp"
#include "OsiClpSolverInterface.hpp"


extern "C"{
#include <api_scilab.h>
#include "sciprint.h"
#include <Scierror.h>
#include <localization.h>
#include <stdlib.h>

const char fname[] = "matintlinprog";
/* ==================================================================== */
int sci_matintlinprog(scilabEnv env, int nin, scilabVar* in, int nopt, scilabOpt opt, int nout, scilabVar* out) 
{
    //Objective function
    double* obj;  
    //Constraint matrix coefficients
    double* conMatrix;
    //intcon Matrix
    double* intcon;  
    //Constraints upper bound
    double* conlb;
    //Constraints lower bound
    double* conub;
    //Lower bounds for variables
    double* lb;  
    //Upper bounds for variables
    double* ub;
    //options for maximum iterations and writing mps
    double* options;
    //Flag for Mps
    double flagMps;
    //mps file path
    char * mpsFile;

    //Number of rows and columns in objective function
    int nVars=0, nCons=0,temp1=0,temp2=0;
    int numintcons=0;
    double valobjsense;
    

	if (nin !=11) //Checking the input arguments
	{
        	Scierror(999, "%s: Wrong number of input arguments: %d expected.\n", fname, 11);
        	return STATUS_ERROR; 
	}
	
	if (nout !=8) //Checking the output arguments

	{
		Scierror(999, "%s: Wrong number of output argument(s): %d expected.\n", fname, 8);
		return 1;
	}

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



    //Objective function from Scilab
    if (scilab_isDouble(env, in[2]) == 0 || scilab_isMatrix2d(env, in[2]) == 0)
	{
    	Scierror(999, "%s: Wrong type for input argument #%d: A double matrix expected.\n", fname, 3);
   		return 1;
	}	
	

	scilab_getDoubleArray(env, in[2], &obj);

    //intcon matrix
    if (scilab_isDouble(env, in[3]) == 0 || scilab_isMatrix2d(env, in[3]) == 0)
	{
    	Scierror(999, "%s: Wrong type for input argument #%d: A double matrix expected.\n", fname, 4);
   		return 1;
	}	

	scilab_getDoubleArray(env, in[3], &intcon);

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
		

		scilab_getDoubleArray(env, in[5], &conlb);

        //conUB matrix from scilab
        if (scilab_isDouble(env, in[6]) == 0 || scilab_isMatrix2d(env, in[6]) == 0)
		{
    		Scierror(999, "%s: Wrong type for input argument #%d: A double matrix expected.\n", fname, 7);
   			return 1;
		}	
		
		scilab_getDoubleArray(env, in[6], &conub);

    }

    //lb matrix from scilab
   	if (scilab_isDouble(env, in[7]) == 0 || scilab_isMatrix2d(env, in[7]) == 0)
	{
    	Scierror(999, "%s: Wrong type for input argument #%d: A double matrix expected.\n", fname, 8);
   		return 1;
	}	
	
	scilab_getDoubleArray(env, in[7], &lb);


    //ub matrix from scilab
    if (scilab_isDouble(env, in[8]) == 0 || scilab_isMatrix2d(env, in[8]) == 0)
	{
    	Scierror(999, "%s: Wrong type for input argument #%d: A double matrix expected.\n", fname, 9);
   		return 1;
	}	
	
	scilab_getDoubleArray(env, in[8], &ub);

    //Object Sense
	if (scilab_isDouble(env, in[9]) == 0 || scilab_isScalar(env, in[9]) == 0)
	{
    	Scierror(999, "%s: Wrong type for input argument #%d: An int expected.\n", fname, 10);
    	return 1;
	}

	scilab_getDouble(env, in[9], &valobjsense);

    //get options from scilab
	if (scilab_isDouble(env, in[10]) == 0 || scilab_isMatrix2d(env, in[10]) == 0)
	{
    	Scierror(999, "%s: Wrong type for input argument #%d: A double matrix expected.\n", fname, 11);
   		return 1;
	}
	scilab_getDoubleArray(env, in[10], &options);


    //------------Temporary Version to make coin packed matrix------
    OsiClpSolverInterface solver1;  
    
    CoinPackedMatrix *matrix =  new CoinPackedMatrix(false , 0 , 0);
    matrix->setDimensions(0 , nVars);
    for(int i=0 ; i<nCons ; i++)
    {
        CoinPackedVector row;
        for(int j=0 ; j<nVars ; j++)
        {
            row.insert(j, conMatrix[i+j*nCons]);
        }
        matrix->appendRow(row);
    }


    solver1.loadProblem(*matrix, lb, ub, obj, conlb, conub);
    
    for(int i=0;i<numintcons;i++)
        solver1.setInteger(intcon[i]-1);

    solver1.setObjSense(valobjsense);

    //-------------------------------------------------------------
    
    CbcModel model(solver1);

    model.solver()->setHintParam(OsiDoReducePrint, true, OsiHintTry);
    
    if((int)options[0]!=0)
            model.setIntegerTolerance(options[0]);
    if((int)options[1]!=0)
            model.setMaximumNodes((int)options[1]); 
    if((int)options[2]!=0)
            model.setMaximumSeconds(options[2]);
    if((int)options[3]!=0)
            model.setAllowableGap(options[3]);
    if((int)options[4]!=0)
	    model.setNumberThreads(options[4]);

    
    
    model.branchAndBound();
    
    const double *val = model.getColSolution();	//added const
    
    //Output the solution to Scilab
    
    //get solution for x
    const double* xValue = model.getColSolution();	//added const

    //get objective value
    const double objValue = model.getObjValue();	//added const

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
    double nodeCount=model.getNodeCount();
    double nfps=model.numberIntegers();
    double U=model.getObjValue();
    double L=model.getBestPossibleObjValue();
    double iterCount=model.getIterationCount();

	out[0] = scilab_createDoubleMatrix2d(env, nVars, 1, 0);
	scilab_setDoubleArray(env, out[0], xValue);
	out[1] = scilab_createDouble(env, objValue);
	out[2] = scilab_createDouble(env, status_);
	out[3] = scilab_createDouble(env, nodeCount);
	out[4] = scilab_createDouble(env, nfps);
	out[5] = scilab_createDouble(env, L);
	out[6] = scilab_createDouble(env, U);
	out[7] = scilab_createDouble(env, iterCount);

    //-------------------------------------------------------------
    
    return 0;
}
}
