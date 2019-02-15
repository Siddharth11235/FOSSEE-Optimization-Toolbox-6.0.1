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

#ifndef __QuadNLP_HPP__
#define __QuadNLP_HPP__

#include "IpTNLP.hpp"
extern "C"{
#include <sciprint.h>

}
using namespace Ipopt;

class QuadNLP : public TNLP
{
	private:
		Index numVars_;			// Number of variables.
	
		Index numConstr_; 		// Number of constraints.

		const Number *qMatrix_;	//qMatrix_ is a pointer to matrix of size numVars X numVars_ 
						// with coefficents of quadratic terms in objective function.

		const Number *lMatrix_;//lMatrix_ is a pointer to matrix of size 1*numVars_
						// with coefficents of linear terms in objective function.	
	
						// with coefficients of terms in a each objective in each row.
		const Number *conMatrix_ ;//conMatrix_ is a pointer to matrix of size numConstr X numVars

		const Number *conUB_;	//conUB_ is a pointer to a matrix of size of 1*numConstr_
						// with upper bounds of all constraints.

		const Number *conLB_ ;	//conLB_ is a pointer to a matrix of size of 1*numConstr_ 
						// with lower bounds of all constraints.

		const Number *varUB_;	//varUB_ is a pointer to a matrix of size of 1*numVar_ 
						// with upper bounds of all variables.

		const Number *varLB_;	//varLB_ is a pointer to a matrix of size of 1*numVar_
						// with lower bounds of all variables.

		const Number *varGuess_;	//varGuess_ is a pointer to a matrix of size of 1*numVar_
						// with initial guess of all variables.
	
		Number *finalX_;		//finalX_ is a pointer to a matrix of size of 1*numVar_
						// with final value for the primal variables.

		Number *finalZl_;		//finalZl_ is a pointer to a matrix of size of 1*numVar_
						// with final values for the lower bound multipliers

		Number *finalZu_;		//finalZu_ is a pointer to a matrix of size of 1*numVar_
						// with final values for the upper bound multipliers

		Number *finalLambda_;	//finalLambda_ is a pointer to a matrix of size of 1*numConstr_
						// with final values for the upper bound multipliers

		Number finalObjVal_;		//finalObjVal_ is a scalar with the final value of the objective.

		int status_;			//Solver return status
 
		QuadNLP(const QuadNLP&);
		QuadNLP& operator=(const QuadNLP&);
	public:
		/*
		 * Constructor 
		*/
		QuadNLP(Index nV, Index nC, Number *qM, Number *lM, Number *cM, Number *cUB, Number *cLB, Number *vUB, Number *vLB,Number *vG):
			numVars_(nV),numConstr_(nC),qMatrix_(qM),lMatrix_(lM),conMatrix_(cM),conUB_(cUB),conLB_(cLB),varUB_(vUB),varLB_(vLB),varGuess_(vG),finalX_(0), finalZl_(0), finalZu_(0), finalObjVal_(1e20){	}


		/* Go to :

	http://www.coin-or.org/Ipopt/documentation/node23.html#SECTION00053130000000000000
		For details about these below methods.
		*/
		virtual ~QuadNLP();
		virtual bool get_nlp_info(Index& n, Index& m, Index& nnz_jac_g,
								  Index& nnz_h_lag, IndexStyleEnum& index_style);
		virtual bool get_bounds_info(Index n, Number* x_l, Number* x_u,
									 Index m, Number* g_l, Number* g_u);
		virtual bool get_starting_point(Index n, bool init_x, Number* x,
										bool init_z, Number* z_L, Number* z_U,
										Index m, bool init_lambda,
										Number* lambda);
		virtual bool eval_f(Index n, const Number* x, bool new_x, Number& obj_value);
		virtual bool eval_grad_f(Index n, const Number* x, bool new_x, Number* grad_f);
		virtual bool eval_g(Index n, const Number* x, bool new_x, Index m, Number* g);
		virtual bool eval_jac_g(Index n, const Number* x, bool new_x,
								Index m, Index nele_jac, Index* iRow, Index *jCol,
								Number* values);
		virtual bool eval_h(Index n, const Number* x, bool new_x,
							Number obj_factor, Index m, const Number* lambda,
							bool new_lambda, Index nele_hess, Index* iRow,
							Index* jCol, Number* values);
		virtual void finalize_solution(SolverReturn status,
						   Index n, const Number* x, const Number* z_L, const Number* z_U,
						   Index m, const Number* g, const Number* lambda, Number obj_value,
						   const IpoptData* ip_data,
						   IpoptCalculatedQuantities* ip_cq);
		
		double * getX();		//Returns a pointer to a matrix of size of 1*numVar 
						// with final value for the primal variables.

		double * getZu();		//Returns a pointer to a matrix of size of 1*numVars
						// with final values for the upper bound multipliers

		double * getZl();		//Returns a pointer to a matrix of size of 1*numVars
						// with final values for the upper bound multipliers

		double * getLambda();	//Returns a pointer to a matrix of size of 1*numConstr
						// with final values for the constraint multipliers


		double getObjVal();		//Returns the output of the final value of the objective.

		int returnStatus();		//Returns the status count

		
};

#endif __QuadNLP_HPP__
