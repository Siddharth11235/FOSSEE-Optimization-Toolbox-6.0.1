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
    if(wcscmp(_pwstFuncName, L"linearprog") == 0){ addCStackFunction(L"linearprog", &sci_linearprog, MODULE_NAME); }
    if(wcscmp(_pwstFuncName, L"rmps") == 0){ addCStackFunction(L"rmps", &sci_rmps, MODULE_NAME); }

    return 1;
}
