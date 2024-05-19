import os
import shutil  

from checkAnswer import checkFunctions

checkFunction = {
    "lua"   :   checkFunctions.LuaCheck,
    "C"     :   checkFunctions.CCheck,
    "Java"  :   checkFunctions.JavaCheck,
}

def loads(file_path):
    with open(file=file_path, mode='r', encoding='utf-8') as case_loader:
        return eval(''.join(case_loader.readlines()))

def check(problem_id, language, code):
    workdir = os.path.join("../../workdir/users/", "tempuser1")
    os.makedirs(workdir, exist_ok=True)
    with open(file=os.path.join(workdir, "userCode"), mode='w', encoding='utf-8') as saveCode:
        saveCode.write(code)

    cases = loads("../problems/problem{}/testCases.json".format(problem_id))
    
    checkFunctionAccordingToLanguage = checkFunction[language]
    testCode, testMsg = checkFunctionAccordingToLanguage(cases)

    try:  
        pass
        # shutil.rmtree(workdir)  
    except OSError as e:  
        print(f"Error: {e.strerror}. The folder may not exist or you may not have permission to delete it.")

    return testCode, testMsg

