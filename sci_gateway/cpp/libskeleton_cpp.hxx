#ifndef __LIBSKELETON_CPP_GW_HXX__
#define __LIBSKELETON_CPP_GW_HXX__

#ifdef _MSC_VER
#ifdef LIBSKELETON_CPP_GW_EXPORTS
#define LIBSKELETON_CPP_GW_IMPEXP __declspec(dllexport)
#else
#define LIBSKELETON_CPP_GW_IMPEXP __declspec(dllimport)
#endif
#else
#define LIBSKELETON_CPP_GW_IMPEXP
#endif

extern "C" LIBSKELETON_CPP_GW_IMPEXP int libskeleton_cpp(wchar_t* _pwstFuncName);


CPP_GATEWAY_PROTOTYPE(sci_cpperror);
CPP_GATEWAY_PROTOTYPE(sci_cppfoo);
CPP_GATEWAY_PROTOTYPE(sci_cppmultiplybypi);
CPP_GATEWAY_PROTOTYPE(sci_cppsub);
CPP_GATEWAY_PROTOTYPE(sci_cppsum);
CPP_GATEWAY_PROTOTYPE(sci_linearprog);

#endif /* __LIBSKELETON_CPP_GW_HXX__ */
