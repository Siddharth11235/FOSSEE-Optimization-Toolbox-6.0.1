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

#include "minuncNLP.hpp"

extern "C"
{

#include <api_scilab.h>
#include <Scierror.h>
#include <BOOL.h>
#include <localization.h>
#include <sciprint.h>
#include <string.h>
#include <assert.h>

using namespace std;
using namespace Ipopt;

minuncNLP::~minuncNLP()
{
	if(finalX_) delete[] finalX_;
}

//get NLP info such as number of variables,constraints,no.of elements in jacobian and hessian to allocate memory
bool minuncNLP::get_nlp_info(Index& n, Index& m, Index& nnz_jac_g, Index& nnz_h_lag, IndexStyleEnum& index_style)
{
	finalGradient_ = (double*)malloc(sizeof(double) * numVars_ * 1);
	finalHessian_ = (double*)malloc(sizeof(double) * numVars_ * numVars_);
	n=numVars_; // Number of variables
	m=numConstr_; // Number of constraints
	nnz_jac_g = 0; // No. of elements in Jacobian of constraints 
	nnz_h_lag = n*(n+1)/2; // No. of elements in lower traingle of Hessian of the Lagrangian.
	index_style=C_STYLE; // Index style of matrices
	return true;
}

//get variable and constraint bound info
bool minuncNLP::get_bounds_info(Index n, Number* x_l, Number* x_u, Index m, Number* g_l, Number* g_u)
{
	unsigned int i;
	for(i=0;i<n;i++)
	{
		x_l[i]=-1.0e19;
		x_u[i]=1.0e19;
	}

        g_l=NULL;
        g_u=NULL;
	return true;
}

// return the value of the constraints: g(x)
bool minuncNLP::eval_g(Index n, const Number* x, bool new_x, Index m, Number* g)
{
  	// return the value of the constraints: g(x)
  	g=NULL;
  	return true;
}

// return the structure or values of the jacobian
bool minuncNLP::eval_jac_g(Index n, const Number* x, bool new_x,Index m, Index nele_jac, Index* iRow, Index *jCol,Number* values)
{
 	if (values == NULL) 
 	{
    		// return the structure of the jacobian of the constraints
    		iRow=NULL; 
    		jCol=NULL;
  	}
  	else 
	{
		values=NULL;
  	}

  	return true;
}

//get value of objective function at vector x
bool minuncNLP::eval_f(Index n, const Number* x, bool new_x, Number& obj_value)
{
  	double check;
  	int* funptr=NULL;  
  	if (scilab_getType(env, in[0]) != 13)
	{
    	Scierror(999, "%s: Wrong type for input argument #%d: A function expected.\n", fname, 1);
   		return 1;
	}	

	scilab_getPointer( env, in[0], &funptr);

  	char name[20]="f";
  	double obj=0;
  	const Number *xNew=x;
  	createMatrixOfDouble(pvApiCtx, 7, 1, numVars_, xNew);
  	int positionFirstElementOnStackForScilabFunction = 7;
  	int numberOfRhsOnScilabFunction = 1;
  	int numberOfLhsOnScilabFunction = 2;
  	int pointerOnScilabFunction     = *funptr;
  
  	C2F(scistring)(&positionFirstElementOnStackForScilabFunction,name,
                                                               &numberOfLhsOnScilabFunction,
                                                               &numberOfRhsOnScilabFunction,(unsigned long)strlen(name));
                               

	if (scilab_isDouble(env, in[7]) == 0 || scilab_isScalar(env, in[7]) == 0)
	{
    	Scierror(999, "%s: Wrong type for input argument #%d: An int expected.\n", fname, 5);
    	return 1;
	}

	scilab_getDouble(env, in[7], &check);


	if (check==1)
	{
		return true;
	}	
	else
	{ 
		if (scilab_isDouble(env, in[6]) == 0 || scilab_isScalar(env, in[6]) == 0)
		{
			sciprint("No Objective value");
			return 1;
		}

		scilab_getDouble(env, in[6], &obj);

  		obj_value=obj;  
	}
  	return true;
}

//get value of gradient of objective function at vector x.
bool minuncNLP::eval_grad_f(Index n, const Number* x, bool new_x, Number* grad_f)
{
  	double check;
  	if (flag1_==0)
  	{	
  		int* gradhessptr=NULL;
  		if (scilab_getType(env, in[1]) != 13)
		{
			Scierror(999, "%s: Wrong type for input argument #%d: A function expected.\n", fname, 2);
	   		return 1;
		}	

		scilab_getPointer( env, in[1], &gradhesptr); 
  		const Number *xNew=x;
  		double t=1;
  		createMatrixOfDouble(pvApiCtx, 7, 1, numVars_, xNew);
  		createScalarDouble(pvApiCtx, 8,t);
  		int positionFirstElementOnStackForScilabFunction = 7;
  		int numberOfRhsOnScilabFunction = 2;
  		int numberOfLhsOnScilabFunction = 2;
  		int pointerOnScilabFunction     = *gradhessptr;
		char name[20]="gradhess";
 
  		C2F(scistring)(&positionFirstElementOnStackForScilabFunction,name,
                                                               &numberOfLhsOnScilabFunction,
                                                               &numberOfRhsOnScilabFunction,(unsigned long)strlen(name));
  	}

  	else if (flag1_==1)
  	{
  		int* gradptr=NULL;
  		if (scilab_getType(env, in[3]) != 13)
		{
			Scierror(999, "%s: Wrong type for input argument #%d: A function expected.\n", fname, 4);
	   		return 1;
		}	

		scilab_getPointer( env, in[3], &gradptr);
  		const Number *xNew=x;
	  	createMatrixOfDouble(pvApiCtx, 7, 1, numVars_, xNew);
  		int positionFirstElementOnStackForScilabFunction = 7;
  		int numberOfRhsOnScilabFunction = 1;
  		int numberOfLhsOnScilabFunction = 2;
  		int pointerOnScilabFunction     = *gradptr;
		char name[20]="fGrad1";
 	
  		C2F(scistring)(&positionFirstElementOnStackForScilabFunction,name,
        	                                                       &numberOfLhsOnScilabFunction,
        	                                                       &numberOfRhsOnScilabFunction,(unsigned long)strlen(name));
   	}

	if (scilab_isDouble(env, in[7]) == 0 || scilab_isScalar(env, in[7]) == 0)
	{
    	Scierror(999, "%s: Wrong type for input argument #%d: An int expected.\n", fname, 5);
    	return 1;
	}

	scilab_getDouble(env, in[7], &check);
	if (check==1)
	{
		return true;
	}	
	else
	{ 
		double* resg;  
  		int x0_rows,x0_cols;                           
  		if (scilab_isDouble(env, in[6]) == 0 || scilab_isMatrix2d(env, in[6]) == 0)
		{
			Scierror(999, "%s: Wrong type for input argument #%d: A double matrix expected.\n", fname, 7);
			return 1;
		}
		
		scilab_getDoubleArray(env, in[6], &resg);
	
  		Index i;
  		for(i=0;i<numVars_;i++)
  		{
			grad_f[i]=resg[i];
    	    	finalGradient_[i]=resg[i];
  		}
	}
  	return true;
}

// This method sets initial values for required vectors . For now we are assuming 0 to all values. 
bool minuncNLP::get_starting_point(Index n, bool init_x, Number* x,bool init_z, Number* z_L, Number* z_U,Index m, bool init_lambda,Number* lambda)
{
 	assert(init_x == true);
  	assert(init_z == false);
  	assert(init_lambda == false);
	if (init_x == true)
	{ //we need to set initial values for vector x
		for (Index var=0;var<n;var++)
			x[var]=varGuess_[var];//initialize with 0 or we can change.
	}

	return true;
}

/*
 * Return either the sparsity structure of the Hessian of the Lagrangian, 
 * or the values of the Hessian of the Lagrangian  for the given values for
 * x,lambda,obj_factor.
*/

bool minuncNLP::eval_h(Index n, const Number* x, bool new_x,Number obj_factor, Index m, const Number* lambda,bool new_lambda, Index nele_hess, Index* iRow,Index* jCol, Number* values)
{
	double check;
	if (values==NULL)
	{
		Index idx=0;
		for (Index row = 0; row < numVars_; row++) 
		{
			for (Index col = 0; col <= row; col++)
			{
				iRow[idx] = row;
				jCol[idx] = col;
				idx++;
		  	}
		}
	}

	else 
	{	
		if(flag2_==0)
	  	{
			int* gradhessptr=NULL;
			if (scilab_getType(env, in[1]) != 13)
			{
				Scierror(999, "%s: Wrong type for input argument #%d: A function expected.\n", fname, 2);
		   		return 1;
			}	

			scilab_getPointer( env, in[1], &gradhesptr);    
     	
			const Number *xNew=x;
  			double t=2;
			createMatrixOfDouble(pvApiCtx, 7, 1, numVars_, xNew);
  			createScalarDouble(pvApiCtx, 8,t);
  			int positionFirstElementOnStackForScilabFunction = 7;
  			int numberOfRhsOnScilabFunction = 2;
  			int numberOfLhsOnScilabFunction = 2;
  			int pointerOnScilabFunction     = *gradhessptr;
			char name[20]="gradhess";
  	
  			C2F(scistring)(&positionFirstElementOnStackForScilabFunction,name,
                	                                               &numberOfLhsOnScilabFunction,
                	                                               &numberOfRhsOnScilabFunction,(unsigned long)strlen(name));
 	    }	

 	    else if (flag2_==1)
 	    {		
			int* hessptr=NULL;
			if (scilab_getType(env, in[5]) != 13)
			{
				Scierror(999, "%s: Wrong type for input argument #%d: A function expected.\n", fname, 6);
		   		return 1;
			}	

			scilab_getPointer( env, in[5], &hessptr);             	
			const Number *xNew=x;	
  			createMatrixOfDouble(pvApiCtx, 7, 1, numVars_, xNew);
  			int positionFirstElementOnStackForScilabFunction = 7;
  			int numberOfRhsOnScilabFunction = 1;
  			int numberOfLhsOnScilabFunction = 2;
  			int pointerOnScilabFunction     = *hessptr;
			char name[20]="fHess1";
  	
  			C2F(scistring)(&positionFirstElementOnStackForScilabFunction,name,
                	                                               &numberOfLhsOnScilabFunction,
                	                                               &numberOfRhsOnScilabFunction,(unsigned long)strlen(name));	
 	    }	

		if (scilab_isDouble(env, in[7]) == 0 || scilab_isScalar(env, in[7]) == 0)
		{
			Scierror(999, "%s: Wrong type for input argument #%d: An int expected.\n", fname, 8);
			return 1;
		}

		scilab_getDouble(env, in[7], &check);
		if (check==1)
		{
			return true;
		}	
		else
		{ 
	        double* resh;  
  			int x0_rows,x0_cols;                           
  			if (scilab_isDouble(env, in[6]) == 0 || scilab_isMatrix2d(env, in[6]) == 0)
			{
				Scierror(999, "%s: Wrong type for input argument #%d: A double matrix expected.\n", fname, 7);
				return 1;
			}
		
			scilab_getDoubleArray(env, in[6], &resh);
			
			Index index=0;
			for (Index row=0;row < numVars_ ;++row)
			{
				for (Index col=0; col <= row; ++col)
				{
					values[index++]=obj_factor*(resh[numVars_*row+col]);
				}
			}
	
			Index i;
			for(i=0;i<numVars_*numVars_;i++)
			{
       				finalHessian_[i]=resh[i];
			}
		}	
	}	

       	return true;
}


void minuncNLP::finalize_solution(SolverReturn status,Index n, const Number* x, const Number* z_L, const Number* z_U,Index m, const Number* g, const Number* lambda, Number obj_value,const IpoptData* ip_data,IpoptCalculatedQuantities* ip_cq)
{
	finalX_ = new double[n];
	for (Index i=0; i<n; i++) 
	{
    		 finalX_[i] = x[i];
	}

	finalObjVal_ = obj_value;
	status_ = status;
}


const double * minuncNLP::getX()
{	
	return finalX_;
}

const double * minuncNLP::getGrad()
{	
	return finalGradient_;
}

const double * minuncNLP::getHess()
{	
	return finalHessian_;
}

double minuncNLP::getObjVal()
{	
	return finalObjVal_;
}

int minuncNLP::returnStatus()
{	
	return status_;
}

}



