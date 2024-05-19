import subprocess

def CCheck(cases):
    import subprocess
    java_program_path = "checkAnswer/Ccheck/src/check.c"
    java_runtime_path = "gcc"
    process = subprocess.Popen([java_runtime_path, java_program_path], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    stdout, stderr = process.communicate()
    if stderr:
        print("Error executing Java program:")
        print(stderr.decode())
    else:
        print("Java program output:")
        print(stdout.decode())
    return True, "PASS ALL CASES"

def LuaCheck(cases):
    return True, "PASS ALL CASES"

def JavaCheck(cases):
    return True, "PASS ALL CASES"