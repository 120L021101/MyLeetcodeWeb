#ifndef CHECKANSWER_CCHECK_SRC_CHECK_H
#define CHECKANSWER_CCHECK_SRC_CHECK_H

typedef void * pArg;
typedef void * pRes;
typedef struct{
    size_t argSize;
    size_t resSize;
    pArg   argAddr;
    pRes   resAddr;
}* pCase;
typedef struct 
{
    size_t  arg_number;
    pCase*   arg_vector;
} Cases;
typedef Cases* pCases;

#ifndef bool
#define bool unsigned char
#define TRUE    1
#define FALSE   0
#endif

typedef struct {
    void * addr;
    size_t size;
} *pResult;

typedef unsigned char* memoryUnit;

bool check(pCases args, size_t argc, const char *wrapper);

#endif