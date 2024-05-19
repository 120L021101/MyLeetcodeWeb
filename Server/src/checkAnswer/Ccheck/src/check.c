#include <Windows.h>
#include <stdio.h>
#include "check.h"

typedef pResult (*wrapperFunc)(pArg);

static bool isResultEqual(pRes res1, pRes res2);

bool check(pCases cases, size_t case_num, const char *wrapper) {
    // 外链接wrapper函数
    HMODULE hModule = LoadLibraryA(wrapper);
    if (hModule == NULL) {
        fprintf(stderr, "wrapper does not exist.\n");
        return FALSE;
    }
    wrapperFunc wFunc = GetProcAddress(hModule, "wrapper_function");
    for (size_t i = 0; i < case_num; ++i) {
        pResult result = wFunc(cases[i]);

    }
    return 0;
}