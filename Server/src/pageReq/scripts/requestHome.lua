local function readJson(jsonReader)
    -- 该函数不关闭jsonReader --
    -- 无奈之举，没有时间安装lua的json解析器，以后有机会在继续吧！ --
    local fileContent = ""
    for line in jsonReader:lines() do
        fileContent = fileContent .. line
    end
    local retInfo = {}
    for item in string.gmatch(fileContent, "(\"[^\"]+\":[ ]\"[^\"]+\")", 1) do
        local key_start, key_end = string.find(item, "\"[^\"]+\":", 1, false)
        local key = string.sub(item, key_start, key_end)
        key = string.sub(key, 2, #key - 2)
        local value_start, value_end = string.find(item, ": \"([^\"]+)\"", 1, false)
        local value = string.sub(item, value_start, value_end)
        value = string.sub(value, 4, #value - 2)
        retInfo[key] = value
    end
    return retInfo
end

local function request()
    local frameworkPath = 'pageReq/pages/home.html'
    local frameworkFile = io.open(frameworkPath, "r")
    local framework = ""
    if frameworkFile == nil then
        return error("Cannot open " .. frameworkPath, 0)
    end
    for line in frameworkFile:lines() do
        framework = framework .. line .. "\n"
    end
    frameworkFile:close()
    
    local problemsSetDir = '../problems/'
    local maxRows = 10
    local information_list = {}
    local information_format = [[
        <div class="problem-item">  
            <span class="problem-number">%s</span>  
            <span class="problem-title">%s</span>  
            <a href="/problem?id=%d" class="solve-btn", id="jump">Solve</a>  
        </div>  
    ]]
    for i = 1, maxRows do
        local jsonReader = io.open(problemsSetDir .. "problem" .. i .. "/content.json", "r")
        if jsonReader == nil then
            break
        end
        local tInfo = readJson(jsonReader)
        information_list[i] = string.format(
            information_format, "" .. i, tInfo["title"], i
        )
        jsonReader:close()
    end
    local insertInformation = ""
    for i = 1, #information_list do
        insertInformation = insertInformation .. information_list[i]
    end
    return string.format(framework, insertInformation)
end

return request