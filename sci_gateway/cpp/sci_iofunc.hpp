// Symphony Toolbox for Scilab
// (Declaration of) Functions for input and output from Scilab
// By Keyur Joshi

#ifndef SCI_IOFUNCHEADER
#define SCI_IOFUNCHEADER



//input
scilabVar* getScilabFunc(scilabEnv env, int numVars, const double* x, wchar_t* name, int nin, int nout);/*
int getDoubleFromScilab(scilabEnv env, scilabVar* in, int argNum, double *dest);
int getUIntFromScilab(scilabEnv env, scilabVar* in, int argNum, int *dest);
int getIntFromScilab(scilabEnv env, scilabVar* in, int argNum, int *dest);
//int getFixedSizeDoubleMatrixFromScilab(int argNum, int rows, int cols, double **dest);
int getDoubleMatrixFromScilab(scilabEnv env, scilabVar* in, int argNum,  double *dest);
//int getFixedSizeDoubleMatrixInList(int argNum, int itemPos, int rows, int cols, double **dest);
int getStringFromScilab(scilabEnv env, scilabVar* in, int argNum,wchar_t** dest);
//bool getFunctionFromScilab1(int n,char name[], double *x,int posFirstElementOnStackForSF,int nOfRhsOnSF,int nOfLhsOnSF, double **dest);
//bool getHessFromScilab(int n,int numConstr_,char name[], double *x,double *obj,double *lambda,int posFirstElementOnStackForSF,int nOfRhsOnSF,int nOfLhsOnSF, double **dest);
int getIntMatrixFromScilab(scilabEnv env, scilabVar* in, int argNum, int *rows, int *cols, int **dest);

//output
int return0toScilab(scilabEnv env, scilabVar* out, int argNum);
int returnDoubleToScilab(scilabEnv env, scilabVar* out, int argNum, double retVal);
int returnDoubleMatrixToScilab(scilabEnv env, scilabVar* out, int argNum, int rows, int cols,  const double *dest);//added const to dest
int returnIntegerMatrixToScilab(scilabEnv env, scilabVar* out, int argNum, int rows, int cols, int *dest);
*/

#endif //SCI_IOFUNCHEADER

