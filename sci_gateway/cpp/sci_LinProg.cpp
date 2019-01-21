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

#include <api_scilab.h>
#include <Scierror.h>
#include <localization.h>
#include <sciprint.h>


#include "sci_iofunc.hpp"
#include"OsiSolverInterface.hpp"
#include "OsiClpSolverInterface.hpp"
#include "CoinPackedMatrix.hpp"
#include "CoinPackedVector.hpp"

extern "C"{
//Solver function
static const char fname[] = "linearprog";
/* ==================================================================== */
int sci_linearprog(scilabEnv env, int nin, scilabVar* in, int nopt, scilabOpt* opt, int nout, scilabVar* out) 
{
	//Objective function
	double* obj;  
	//Constraint matrix coefficients
	double* conMatrix;  
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
	//Number of rows and columns in objective function
	int nVars=0, nCons=0,temp1=0,temp2=0;
	

	if (nin != 9) //Checking the input arguments

	{
		Scierror(77, "%s: Wrong number of input argument(s): %d expected.\n", fname, 9);
		return 1;
	}

	if (nout !=6) //Checking the output arguments

	{
		Scierror(77, "%s: Wrong number of output argument(s): %d expected.\n", fname, 6);
		return 1;
	}
	////////// Manage the input argument //////////
	
	//Number of Variables
	if(getIntFromScilab(env, in, 1,&nVars))
	{
		return 1;
	}

	//Number of Constraints
	if (getIntFromScilab(env, in, 2,&nCons))
	{
		return 1;
	}

	//Objective function from Scilab
	temp1 = nVars;
	temp2 = nCons;
	if (getDoubleMatrixFromScilab(env, in,3,obj))
	{
		return 1;
	}

	if (nCons!=0)
	{
		//conMatrix matrix from scilab
		temp1 = nCons;
		temp2 = nVars;

		if (getDoubleMatrixFromScilab(env, in,4,conMatrix))
		{
			return 1;
		}

		//conLB matrix from scilab
		temp1 = nCons;
		temp2 = 1;
		if (getDoubleMatrixFromScilab(env, in, 5,conlb))
		{
			return 1;
		}

		//conUB matrix from scilab
		if (getDoubleMatrixFromScilab(env, in, 6,conub))
		{
			return 1;
		}

	}

	//lb matrix from scilab
	temp1 = 1;
	temp2 = nVars;
	if (getDoubleMatrixFromScilab(env, in, 7, lb))
	{
		return 1;
	}


	//ub matrix from scilab
	if (getDoubleMatrixFromScilab(env, in, 8,ub))
	{
		return 1;
	}

	//get options from scilab
	if(getDoubleMatrixFromScilab(env, in, 9, options))
	{
		return 1;      
	}


	OsiSolverInterface* si = new OsiClpSolverInterface();
   //Defining the constraint matrix
   CoinPackedMatrix *matrix =  new CoinPackedMatrix(false , 0 , 0);
   matrix->setDimensions(0 , nVars);
   for(int i=0 ; i<nCons ; i++)
   	{
    	CoinPackedVector row;
	 	for(int j=0 ; j<nVars; j++)
	 		{
   				row.insert(j, conMatrix[i+j*nCons]);
   	 		}
        matrix->appendRow(row);
   	}
	//setting options for maximum iterations
    si->setIntParam(OsiMaxNumIteration,options[0]);

    //Load the problem to OSI
    si->loadProblem(*matrix , lb , ub, obj , conlb , conub);

    //Solve the problem
    si->initialSolve();
	//Output the solution to Scilab
	//get solution for x
	const double* xValue = si->getColSolution();
	
	//get objective value
	double objValue = si->getObjValue();
	
		//get Status value
	double status_ = 0;
	if(si->isProvenOptimal())
			status_=0;
	else if(si->isProvenPrimalInfeasible())
			status_=1;
	else if(si->isProvenDualInfeasible())
			status_=2;
	else if(si->isIterationLimitReached())
			status_=3;
	else if(si->isAbandoned())
			status_=4;
	else if(si->isPrimalObjectiveLimitReached())
			status_=5;
	else if(si->isDualObjectiveLimitReached())
			status_=6;
		
	//get number of iterations
	double iterations  = si->getIterationCount(); 	
	
	//get reduced cost
	const double* Zl = si->getReducedCost();
	
	//get dual vector
	const double* dual = si->getRowPrice();

	returnDoubleMatrixToScilab(env, out,1 , 1 , nVars , xValue);
	returnDoubleMatrixToScilab(env, out,2 , 1 , 1 , &objValue);
	returnDoubleMatrixToScilab(env, out, 3 , 1 , 1 , &status_);
	returnDoubleMatrixToScilab(env, out, 4 , 1 , 1 , &iterations);
	returnDoubleMatrixToScilab(env, out,5 , 1 , nVars , Zl);
	returnDoubleMatrixToScilab(env,out,6 , 1 , nCons , dual);
	
	}
}


  	
   
