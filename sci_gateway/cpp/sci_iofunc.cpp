// Symphony Toolbox for Scilab
// (Definition of) Functions for input and output from Scilab
// By Keyur Joshi

#include "api_scilab.h"
#include "Scierror.h"
#include "sciprint.h"
#include "BOOL.h"
#include <localization.h>
#include "call_scilab.h"
#include <string.h>


using namespace std;
/*
int getFunctionFromScilab(int argNum, int **dest)
{	
	//data declarations
	SciErr sciErr;
	int iRet,*varAddress, iType;
	double inputDouble;
	const char errMsg[]="Wrong type for input argument #%d: A function is expected.\n";
	const int errNum=999;
	//get variable address
	sciErr = getVarAddressFromPosition(pvApiCtx, 1, dest);
	if(sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 1;
	}
	//check that the variable is necessarily a function
	sciErr = getVarType(pvApiCtx, *dest, &iType);
  	if(sciErr.iErr || iType != sci_c_function)
	{
		Scierror(errNum,errMsg,argNum);
		return 1;
	}
	return 0;
	
}
*/
int getDoubleFromScilab(scilabEnv env, scilabVar* in,int argNum, double *dest)
{
	//data declarations
	const char errMsg[]="Wrong type for input argument #%d: A double is expected.\n";
	const int errNum=999;



	//check that it is a non-complex double
	if ( !scilab_isDouble(env,in[argNum]) ||  scilab_isComplex(env,in[argNum]) )
	{
		Scierror(errNum,errMsg,argNum);
		return 1;
	}
	//retrieve and store
	scilab_getDouble(env, in[argNum], dest);
	return 0;
}

int getUIntFromScilab(scilabEnv env, scilabVar* in, int argNum, int *dest)
{
	
	double* inputDouble;
	const char errMsg[]="Wrong type for input argument #%d: A nonnegative integer is expected.\n";
	const int errNum=999;
	//same steps as above
	
	if ( !scilab_isDouble(env,in[argNum]) ||  scilab_isComplex(env,in[argNum]) )
	{
		Scierror(errNum,errMsg,argNum);
		return 1;
	}
	scilab_getDouble(env,in[argNum], inputDouble);
	//check that an unsigned int is stored in the double by casting and recasting
	if(((double *)((unsigned int *)inputDouble))!=inputDouble)
	{
		Scierror(errNum,errMsg,argNum);
		return 1;
	}
	dest=(unsigned int *) inputDouble;
	return 0;
}

int getIntFromScilab(scilabEnv env, scilabVar* in, int argNum, int *dest)
{

	double inputDouble;
	const char errMsg[]="Wrong type for input argument #%d: An integer is expected.\n";
	const int errNum=999;
	//same steps as above
	
	if ( !scilab_isDouble(env, in[argNum]) ||  scilab_isComplex(env,in[argNum]) )
	{
		Scierror(errNum,errMsg,argNum);
		return 1;
	}
	scilab_getDouble(env, in[argNum], &inputDouble);
	//check that an int is stored in the double by casting and recasting
	if( ((double)((int)inputDouble))!=inputDouble)
	{
		Scierror(errNum,errMsg,argNum);
		return 1;
	}
	*dest=(int)inputDouble;
	return 0;
}
/*
int getFixedSizeDoubleMatrixFromScilab(int argNum, int rows, int cols, double **dest)
{
	int *varAddress,inputMatrixRows,inputMatrixCols;
	SciErr sciErr;
	const char errMsg[]="Wrong type for input argument #%d: A matrix of double of size %d by %d is expected.\n";
	const int errNum=999;
	//same steps as above
	sciErr = getVarAddressFromPosition(pvApiCtx, argNum, &varAddress);
	if (sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 1;
	}
	if ( !isDoubleType(pvApiCtx,varAddress) ||  isVarComplex(pvApiCtx,varAddress) )
	{
		Scierror(errNum,errMsg,argNum,rows,cols);
		return 1;
	}
	sciErr = getMatrixOfDouble(pvApiCtx, varAddress, &inputMatrixRows, &inputMatrixCols,NULL);
	if (sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 1;
	}
	//check that the matrix has the correct number of rows and columns
	if(inputMatrixRows!=rows || inputMatrixCols!=cols)
	{
		Scierror(errNum,errMsg,argNum,rows,cols);
		return 1;
	}
	getMatrixOfDouble(pvApiCtx, varAddress, &inputMatrixRows, &inputMatrixCols, dest);
	return 0;
}

*/
int getDoubleMatrixFromScilab(scilabEnv env, scilabVar* in, int argNum,  double *dest)
{
	
	const char errMsg[]="Wrong type for input argument #%d: A matrix of double is expected.\n";
	const int errNum=999;
	//same steps as above
	if(!scilab_isDouble(env,in[argNum]) ||  scilab_isComplex(env, in[argNum]) )
	{
		Scierror(errNum,errMsg,argNum);
		return 1;
	}
	scilab_getDoubleArray(env, in[argNum], &dest);
	
	return 0;
}
/*
int getFixedSizeDoubleMatrixInList(int argNum, int itemPos, int rows, int cols, double **dest)
{
	int *varAddress,inputMatrixRows,inputMatrixCols;
	SciErr sciErr;
	const char errMsg[]="Wrong type for input argument #%d: A matrix of double of size %d by %d is expected.\n";
	const int errNum=999;
	//same steps as above
	sciErr = getVarAddressFromPosition(pvApiCtx, argNum, &varAddress);
	if (sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 1;
	}

	getMatrixOfDoubleInList(pvApiCtx, varAddress, itemPos, &rows, &cols, dest);
	if (sciErr.iErr)
	{
		printError(&sciErr, 0);
		return 1;
	}
	return 0;
}
*/
int getStringFromScilab(scilabEnv env, scilabVar* in, int argNum, wchar_t **dest)
{
	
	if (scilab_isString(env, in[argNum]) == 0 || scilab_isScalar(env, in[1]) == 0)
	{
		Scierror(999,"Wrong type for input argument 1: A file name is expected.\n");
		return 1;
	}

	
    //read the value in that pointer pointing to file name
	scilab_getStringArray(env, in[argNum], &dest);
	return 0;
    
}
/*
bool getFunctionFromScilab1(int n,char name[], double *x,int posFirstElementOnStackForSF,int nOfRhsOnSF,int nOfLhsOnSF, double **dest)
{	
	double check;
  	createMatrixOfDouble(pvApiCtx, posFirstElementOnStackForSF, 1, n, x);  
  	C2F(scistring)(&posFirstElementOnStackForSF,name,&nOfLhsOnSF,&nOfRhsOnSF,(unsigned long)strlen(name));
    
  	if(getDoubleFromScilab(posFirstElementOnStackForSF+1,&check))
  	{
		return true;
	}
	if (check==1)
	{
		return true;
	}	
	else
	{ 
		int x_rows, x_cols;
		if(getDoubleMatrixFromScilab(posFirstElementOnStackForSF, &x_rows, &x_cols, dest))
  		{
			sciprint("No results ");
			return true;
			
  		}
	}	
	return 0;
}

bool getHessFromScilab(int n,int numConstr_,char name[], double *x,double *obj,double *lambda,int posFirstElementOnStackForSF,int nOfRhsOnSF,int nOfLhsOnSF, double **dest)
{	
	double check;
  	createMatrixOfDouble(pvApiCtx, posFirstElementOnStackForSF, 1, n, x);
  	createMatrixOfDouble(pvApiCtx, posFirstElementOnStackForSF+1, 1, 1, obj);
	createMatrixOfDouble(pvApiCtx, posFirstElementOnStackForSF+2, 1, numConstr_, lambda);
  	C2F(scistring)(&posFirstElementOnStackForSF,name,&nOfLhsOnSF,&nOfRhsOnSF,(unsigned long)strlen(name));
                               
  	if(getDoubleFromScilab(posFirstElementOnStackForSF+1,&check))
  	{
		return true;
	}
	if (check==1)
	{
		return true;
	}	
	else
	{ 
		int x_rows, x_cols;
		if(getDoubleMatrixFromScilab(posFirstElementOnStackForSF, &x_rows, &x_cols, dest))
  		{
			sciprint("No results ");
			return 1;	
  		}
	}	
	return 0;
}
*/
int getIntMatrixFromScilab(scilabEnv env, scilabVar* in, int argNum, int *dest)
{
	
	const char errMsg[]="Wrong type for input argument #%d: A matrix of integer is expected.\n";
	const int errNum=999;
	//same steps as above
	 if ( !scilab_isInt32(env,in[argNum]) ||  scilab_isComplex(env,in[argNum]) )
	 {
	 	Scierror(errNum,errMsg,argNum);
	 	return 1;
	 }
	scilab_getInteger32Array(env, in[argNum], &dest);
	
	return 0;
}

int return0toScilab(scilabEnv env, scilabVar* out, int argNum)
{
	out[argNum] = scilab_createDouble(env,0);

	return 0;
}

int returnDoubleToScilab(scilabEnv env, scilabVar* out, int argNum, double retVal)
{
	out[argNum] = scilab_createDouble(env,retVal);
	return 0;
}

int returnDoubleMatrixToScilab(scilabEnv env, scilabVar* out, int argNum, int rows, int cols,  const double *dest)//added const to dest
{

	//same steps as above
	out[argNum] =scilab_createDoubleMatrix2d(env, rows, cols, &dest);

	return 0;
}

int returnIntegerMatrixToScilab(scilabEnv env, scilabVar* out, int argNum, int rows, int cols, int *dest)
{

	out[argNum] = scilab_createIntegerMatrix(env, rows, cols, dest);

	return 0;
}


