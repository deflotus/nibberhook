local owner = "deflotus"
local branch = "main"

local function webImport(file)
    return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/nibberhook/%s/%s.lua"):format(owner, branch, file)), file .. '.lua')()
end

local commands = webImport("commands")
table.foreach(commands, print)