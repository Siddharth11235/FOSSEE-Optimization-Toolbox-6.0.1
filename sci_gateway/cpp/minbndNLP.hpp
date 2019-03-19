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


#ifndef __minbndNLP_HPP__
#define __minbndNLP_HPP__
#include "IpTNLP.hpp"
#include "api_scilab.h"

using namespace Ipopt;

class minbndNLP : public TNLP
{
	private:
	scilabEnv env_;					//Scilab Environment Variable

	scilabEnv in_;					//Scilab input pointer Variable

  	Index numVars_;	                 //Number of input variables

  	Index numConstr_;                //Number of constraints 

  	Number *finalX_;           //finalX_ is a pointer to a matrix of size of 1*1
				         //with final value for the primal variable.

	Number *finalZl_;		 //finalZl_ is a pointer to a matrix of size of 1*numVar_
					 // with final values for the lower bound multipliers

	Number *finalZu_;		 //finalZu_ is a pointer to a matrix of size of 1*numVar_
					 // with final values for the upper bound multipliers

  	Number finalObjVal_;          	 //finalObjVal_ is a scalar with the final value of the objective.

  	int status_;			 //Solver return status


  	const Number *varUB_;	 //varUB_ is a pointer to a matrix of size of 1*1 
					 // with upper bounds of all variable.

  	const Number *varLB_;	 //varLB_ is a pointer to a matrix of size of 1*1
					 // with lower bounds of all variable.
	
  	minbndNLP(const minbndNLP&);
  	minbndNLP& operator=(const minbndNLP&);

	public:

  	/** user defined constructor */
  	minbndNLP(scilabEnv env, scilabVar* in, Index nV, Index nC,Number *LB,Number *UB):env_(env), in_(in),numVars_(nV),numConstr_(nC),finalX_(0),finalZl_(0), finalZu_(0),varLB_(LB),varUB_(UB),finalObjVal_(1e20){	}

  	/** default destructor */
  	virtual ~minbndNLP();

  	/** Method to return some info about the nlp */
  	virtual bool get_nlp_info(Index& n, Index& m, Index& nnz_jac_g,
                            Index& nnz_h_lag, IndexStyleEnum& index_style);

  	/** Method to return the bounds for my problem */
  	virtual bool get_bounds_info(Index n, Number* x_l, Number* x_u,
                               Index m, Number* g_l, Number* g_u);

  	/** Method to return the starting point for the algorithm */
  	virtual bool get_starting_point(Index n, bool init_x, Number* x,
                                  bool init_z, Number* z_L, Number* z_U,
                                  Index m, bool init_lambda,
                                  Number* lambda);

  	/** Method to return the objective value */
  	virtual bool eval_f(Index n, const Number* x, bool new_x, Number& obj_value);

  	/** Method to return the gradient of the objective */
  	virtual bool eval_grad_f(Index n, const Number* x, bool new_x, Number* grad_f);

  	/** Method to return the constraint residuals */
  	virtual bool eval_g(Index n, const Number* x, bool new_x, Index m, Number* g);

  	/** Method to return:
  	*   1) The structure of the jacobian (if "values" is NULL)
   	*   2) The values of the jacobian (if "values" is not NULL)
   	*/
  	virtual bool eval_jac_g(Index n, const Number* x, bool new_x,Index m, Index nele_jac, Index* iRow, Index *jCol,Number* values);

  	/** Method to return:
   	*   1) The structure of the hessian of the lagrangian (if "values" is NULL)
   	*   2) The values of the hessian of the lagrangian (if "values" is not NULL)
   	*/
  	virtual bool eval_h(Index n, const Number* x, bool new_x,Number obj_factor, Index m, const Number* lambda,bool new_lambda, Index nele_hess, Index* iRow,Index* jCol, Number* values);


	//Function to call a scilab function to a C interface
	virtual bool getScilabFunc(scilabVar* out, const Number* x, wchar_t* name, int nin, int nout);

  	/** This method is called when the algorithm is complete so the TNLP can store/write the solution */
  	virtual void finalize_solution(SolverReturn status,Index n, const Number* x, const Number* z_L, const Number* z_U,Index m, const Number* g, const Number* lambda,Number obj_value,const IpoptData* ip_data,IpoptCalculatedQuantities* ip_cq);
  
  	const double * getX();		//Returns a pointer to a matrix of size of 1*1
					//with final value for the primal variable.

	const double * getZl();		//Returns a pointer to a matrix of size of 1*numVars_
					// with final values for the lower bound multipliers

	const double * getZu();		//Returns a pointer to a matrix of size of 1*numVars_
					//with final values for the upper bound multipliers

  	double getObjVal();		//Returns the output of the final value of the objective.

  	int returnStatus();		//Returns the status count

};


#endif
