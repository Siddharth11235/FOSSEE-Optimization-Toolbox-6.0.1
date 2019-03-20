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

#ifndef __minconNLP_HPP__
#define __minconNLP_HPP__
#include "IpTNLP.hpp"
#include "api_scilab.h"

using namespace Ipopt;

class minconNLP : public TNLP
{
	private:

	scilabEnv env_;					//Scilab Environment Variable

	scilabEnv in_;					//Scilab input pointer Variable

  	Index numVars_;	                 //Number of input variables

  	Index numConstr_;                //Number of constraints 

	Number nonlinCon_;               //Number of non-linear constraints

	Number nonlinIneqCon_;		 //Number of non-linear inequality constraints

	const Number *A_;		 //Matrix for linear inequality constraints

	const Number *b_;		 //Matrix for bounds of linear inequality constraints

	const Number *Aeq_;	 //Matrix for linear equality constraints

	const Number *beq_;        //Matrix for bounds of linear equality constraints

	Index Arows_;			 //Number of rows of linear inequality constraints

	Index Acols_;			 //Number of columns of linear inequality constraints

	Index brows_;			 //Number of rows of bounds of linear inequality constraints

	Index bcols_;			 //Number of columns of bounds of linear inequality constraints

	Index Aeqrows_;			 //Number of rows of linear equality constraints

	Index Aeqcols_;			 //Number of columns of linear equality constraints

	Index beqrows_;			 //Number of rows of bounds of linear equality constraints

	Index beqcols_;			 //Number of columns of bounds of linear equality constraints
	

  	const Number *varGuess_;	 //varGuess_ is a pointer to a matrix of size of 1*numVars_
				         //with initial guess of all variables.

	const Number *varUB_;	 //varUB_ is a pointer to a matrix of size of 1*numVar_ 
					 // with upper bounds of all variables.

	const Number *varLB_;	 //varLB_ is a pointer to a matrix of size of 1*numVar_
					 // with lower bounds of all variables.

	Number *finalZl_;		 //finalZl_ is a pointer to a matrix of size of 1*numVar_
					 // with final values for the lower bound multipliers

	Number *finalZu_;		 //finalZu_ is a pointer to a matrix of size of 1*numVar_
					 // with final values for the upper bound multipliers

	Number *finalLambda_;	 //finalLambda_ is a pointer to a matrix of size of 1*numConstr_
					 // with final values for the upper bound multipliers

	Number *finalX_;           //finalX_ is a pointer to a matrix of size of 1*numVars_
				         //with final value for the primal variables.

  	Number *finalGradient_;     //finalGradient_ is a pointer to a matrix of size of numVars_*numVars_
				         //with final value of gradient for the primal variables.


  	Number *finalHessian_;      //finalHessian_ is a pointer to a matrix of size of 1*numVar_
				         //with final value of hessian for the primal variables.


  	Number finalObjVal_;          	 //finalObjVal_ is a scalar with the final value of the objective.

  	int status_;			 //Solver return status

	public:
  	minconNLP(const minconNLP&);
  	minconNLP& operator=(const minconNLP&);

  	/** user defined constructor */
  	minconNLP(scilabEnv env, scilabVar* in, Index nV, Index nC, Number *x0 ,Number *A, Number *b, Number* Aeq, Number *beq, Index Arows, Index Acols, Index brows, Index bcols, Index Aeqrows, Index Aeqcols, Index beqrows, Index beqcols, Number* LB, Number* UB, Number nlC, Number nlIC) : env_(env), in_(in), numVars_(nV), numConstr_(nC), varGuess_(x0), A_(A), b_(b), Aeq_(Aeq), beq_(beq), Arows_(Arows), Acols_(Acols), brows_(brows), bcols_(bcols), Aeqrows_(Aeqrows), Aeqcols_(Aeqcols), beqrows_(beqrows), beqcols_(beqcols), varLB_(LB), varUB_(UB), nonlinCon_(nlC), nonlinIneqCon_(nlIC), finalX_(0), finalZl_(0), finalZu_(0), finalGradient_(0), finalHessian_(0), finalObjVal_(1e20){	}

  	virtual ~minconNLP();
  	
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

  	/** This method is called when the algorithm is complete so the TNLP can store/write the solution */
  	virtual void finalize_solution(SolverReturn status,Index n, const Number* x, const Number* z_L, const Number* z_U,Index m, const Number* g, const Number* lambda,Number obj_value,const IpoptData* ip_data,IpoptCalculatedQuantities* ip_cq);
  
  	const double * getX();		//Returns a pointer to a matrix of size of 1*numVars_ 
					//with final value for the primal variables.
  
  	const double * getGrad();       //Returns a pointer to a matrix of size of 1*numVars_ 
					//with final value of gradient for the primal variables.

  	const double * getHess();       //Returns a pointer to a matrix of size of numVars_*numVars_ 
					//with final value of hessian for the primal variables.
	
	const double * getZl();		//Returns a pointer to a matrix of size of 1*numVars_
					// with final values for the lower bound multipliers

	const double * getZu();		//Returns a pointer to a matrix of size of 1*numVars_
					//with final values for the upper bound multipliers

	const double * getLambda();	//Returns a pointer to a matrix of size of 1*numConstr_
					//with final values for the constraint multipliers

	double getObjVal();		//Returns the output of the final value of the objective.

  	int returnStatus();		//Returns the status count

};

#endif
