from lupa import LuaRuntime  
  
def load_lua(lua_path):
    lua = LuaRuntime()
    with open(file=lua_path, mode='r', encoding='utf-8') as reader:
        lua_code = ''.join(reader.readlines())
        ret_function = lua.execute(lua_code)
    return ret_function

def request(problem_id):
    lua_path = 'pageReq/scripts/requestProblem.lua'
    request_function = load_lua(lua_path)
    html_content = request_function(problem_id)
    return html_content