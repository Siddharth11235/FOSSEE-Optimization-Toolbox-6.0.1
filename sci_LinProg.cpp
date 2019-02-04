/* ==================================================================== */
/* Template toolbox_skeleton */
/* Example detail in "API_scilab getting started" help page */
/* This file is released under the 3-clause BSD license. See COPYING-BSD. */
/* ==================================================================== */
#include "double.hxx"
#include "bool.hxx"
#include "function.hxx"
#include"OsiSolverInterface.hpp"
#include "OsiClpSolverInterface.hpp"
#include "CoinPackedMatrix.hpp"
#include "CoinPackedVector.hpp"

extern "C" 
{
#include "Scierror.h"
#include "localization.h"
#include "api_scilab.h"
#include "sciprint.h"
}
/* ==================================================================== */
types::Function::ReturnValue sci_linearprog(types::typed_list &in, int _iRetCount, types::typed_list &out)
{


	sciprint("no. of inputs: %d\n", in.size());
	sciprint("no. of outputs: %d\n",_iRetCount);
	//Objective function
	types::Double* obj = NULL;  
	//Constraint matrix coefficients
	types::Double*  conMatrix = NULL;  
	//Constraints upper bound
	types::Double*  conLB= NULL;
	//Constraints lower bound
	types::Double*  conUB= NULL;
	//Lower bounds for variables
/*	types::Double*  lb= NULL;  
	//Upper bounds for variables
	types::Double*  ub= NULL;
	//options for maximum iterations and writing mps
	double* options= NULL;
	//Flag for Mps
	types::Double flagMps= NULL;

    ////////// Check the number of input and output arguments //////////
    /* --> [c, d] = foo(a, b) */
    /* check that we have only 9 input arguments */
    if (in.size() != 6)
    {
        Scierror(77, "%s: Wrong number of input argument(s): %d expected.\n", "linearprog", 6);
        return types::Function::Error;
    }

    /* check that we have only 6 output arguments */
    if (_iRetCount != 2)
    {
        Scierror(78, "%s: Wrong number of output argument(s): %d expected.", "linearprog", 2);
        return types::Function::Error;
    }

    ////////// Manage the first input argument (int) //////////

    /* Check that the first input argument is an int */
    if (in[0]->isInt32() == false)
    {
        Scierror(999, "%s: Wrong type for input argument #%d: An int expected.\n", "linearprog", 1);
        return types::Function::Error;
    }

    int nVars = (int)in[0]->getAs<types::Double>();

    ////////// Manage the second input argument (int) //////////

    /* Check that the second input argument is a int */
    if (in[0]->isInt32() == false)
    {
        Scierror(999, "%s: Wrong type for input argument #%d: An int expected.\n", "linearprog", 2);
        return types::Function::Error;
    }

    int nCons = (int) in[1]->getAs<types::Double>();

	////////// Manage the third input argument (double) //////////

	/* Check that the third input argument is a real matrix (and not complex) */
    if (in[2]->isDouble() == false)
    {
        Scierror(999, "%s: Wrong type for input argument #%d: A real matrix expected.\n", "linearprog", 3);
        return types::Function::Error;
    }

    obj = in[2]->getAs<types::Double>();

	
	////////// Manage the fourth input argument (double) //////////

	/* Check that the fourth input argument is a real matrix (and not complex) */
    if (in[3]->isDouble() == false)
    {
        Scierror(999, "%s: Wrong type for input argument #%d: A real matrix expected.\n", "linearprog", 4);
        return types::Function::Error;
    }

    conMatrix = in[3]->getAs<types::Double>();


	////////// Manage the fifth input argument (double) //////////

	/* Check that the fifth input argument is a real matrix (and not complex) */
    if (in[4]->isDouble() == false)
    {
        Scierror(999, "%s: Wrong type for input argument #%d: A real matrix expected.\n", "linearprog", 5);
        return types::Function::Error;
    }

    conLB = in[4]->getAs<types::Double>();


	////////// Manage the sixth input argument (double) //////////

	/* Check that the sixth input argument is a real matrix (and not complex) */
    if (in[5]->isDouble() == false)
    {
        Scierror(999, "%s: Wrong type for input argument #%d: A real matrix expected.\n", "linearprog", 6);
        return types::Function::Error;
    }

    conUB = in[5]->getAs<types::Double>();


	types::Double* pOut1 = new types::Double(1, 1);

	types::Double* pOut2 = new types::Double(1, 1);

	pOut1[0] = 1;
	pOut2[0] = 2;

    ////////// return output parameters //////////
    out.push_back(pOut1);
    out.push_back(pOut2);

    //return gateway status
    return types::Function::OK;
}
/* ==================================================================== */

