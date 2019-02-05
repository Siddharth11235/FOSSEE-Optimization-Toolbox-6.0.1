#include <wchar.h>
#include "libFOSSEE_Optimization_Toolbox.hxx"
extern "C"
{
#include "libFOSSEE_Optimization_Toolbox.h"
#include "addfunction.h"
}

#define MODULE_NAME L"libFOSSEE_Optimization_Toolbox"

int libFOSSEE_Optimization_Toolbox(wchar_t* _pwstFuncName)
{
    if(wcscmp(_pwstFuncName, L"linearprog") == 0){ addCFunction(L"linearprog", &sci_linearprog, MODULE_NAME); }

    return 1;
}
