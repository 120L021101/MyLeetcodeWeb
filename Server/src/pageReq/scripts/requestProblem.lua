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

local function request(problem_id)
    local contentPath = '../problems/problem' .. problem_id .. '/content.json'
    local jsonReader = io.open(contentPath, "r")
    local contentInfo = readJson(jsonReader)
    jsonReader:close()

    local insertFormat = [[
        <h2>Title: %s</h2>  
        <p>%s</p>  
    ]]
    local insertContent = string.format(insertFormat, contentInfo["title"], contentInfo["description"])
    local retFullContent = ""
    local frameworkReader = io.open("pageReq/pages/problem.html")
    for line in frameworkReader:lines() do
        retFullContent = retFullContent .. line .. "\n"
    end
    frameworkReader:close()
    
    local s, e = string.find(retFullContent, "%%s", 1, false)
    retFullContent = retFullContent:sub(1, s - 1) .. insertContent .. retFullContent:sub(e + 1, #retFullContent)

    return retFullContent
end

return request