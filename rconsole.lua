--[[
TODO
make audio logger
command help
]]

local CurrentVersion = "1.0.0"

local Services = setmetatable({}, {
    __index = function(a, b)
        local c = game:GetService(b)

        if c then
            a[b] = c
        end

        return c
    end
})

local LocalPlayer = Services.Players.LocalPlayer

local Commands = {}

Commands.WalkSpeed = {Name = "WalkSpeed", Aliases = {"Speed"}, RequiresArgs = true, Description = "sets walkspeed to given value", Function = function(Value)
    local Humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if Humanoid then
        Humanoid.WalkSpeed = Value
    end
end}

Commands.JumpPower = {Name = "JumpPower", Aliases = {"Jump"}, RequiresArgs = true, Description = "sets jumppower to given value", Function = function(Value)
    local Humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if Humanoid then
        Humanoid.JumpPower = Value
    end
end}

Commands.Console = {Name = "Console", Aliases = {'OldConsole'}, RequiresArgs = false, Description = "loads old roblox console", Function = function()
    loadstring(game:HttpGet("https://gist.githubusercontent.com/luatsuki/a1b48e02d5710ebff8fe1ffb1fc5ea38/raw/055143d9238eb6645fbb1f5c4a9a0122ca90c8f4/Console", true))()
end}

Commands.Explorer = {Name = "Explorer", Aliases = {"Dex"}, RequiresArgs = false, Description = "opens dex explorer", Function = function()
    pcall(function()
        local main = game:GetObjects("rbxassetid://8428317923")[1];
        local d = loadstring(main.Source)()(loadstring(main:WaitForChild("Gui").Source))
    
        math.randomseed(tick())
        local a = {}
        for b = 48, 57 do
            table.insert(a, string.char(b))
        end;
        for b = 65, 90 do
            table.insert(a, string.char(b))
        end;
        for b = 97, 122 do
            table.insert(a, string.char(b))
        end;
        local function RandomCharacters(c)
            if c > 0 then
                return RandomCharacters(c - 1)..a[math.random(1, #a)]
            else
                return ''
            end
        end;
    
        if(shared.last_dex) then
            shared.last_dex:Destroy();
        end
    
        syn.protect_gui(d)
        d.Name = RandomCharacters(math.random(5, 20))
        d.Parent = game:GetService('CoreGui')
        shared.last_dex = d;
    
        local function e(f, g)
            local function h(i, j)
                local k = {}
                local l = {
                    script = j
                }
                local m = {}
                m.__index = function(n, o)
                    if l[o] == nil then
                        return getfenv()[o]
                    else
                        return l[o]
                    end
                end;
                m.__newindex = function(n, o, p)
                    if l[o] == nil then
                        getfenv()[o] = p
                    else
                        l[o] = p
                    end
                end;
                setmetatable(k, m)
                setfenv(i, k)
                return i
            end;
            local function q(j)
                if j.ClassName == 'Script' or j.ClassName == 'LocalScript' then
                    task.spawn(function()
                        pcall(function()
                            h(loadstring(j.Source, '='..j:GetFullName()), j)()
                        end)
                    end)
                end;
                for b, r in pairs(j:GetChildren()) do
                    q(r)
                end
            end;
            q(f)
        end;
        e(d)
    end)
    
    -- // this is extremely inefficient but it works.
    
    local s, e = pcall(function()
        local find = function()
            local cgui = game:GetService("CoreGui")
            for i, v in pairs(cgui:GetChildren()) do
                if v:FindFirstChild("ScriptEditor") then
                    return v;
                end
            end
            return nil;
        end
    
        if shared.gone then
            while wait() do

            end
        end
    
        local dex = find()
        local t = 0;
    
        while not find() and wait() do
            t = t + 1
        end
    
        if t >= 5 then -- means it took more than 5 seconds to find dex meaning this is most likely auto-execute now it will wait for dex to load.
            wait(3)
        end
        
        dex = find();
    
        local add = function(editor) -- adds the search ui btw
            local a=Instance.new("Frame")local b=Instance.new("TextBox")local c=Instance.new("UITextSizeConstraint")local d=Instance.new("TextLabel")local e=Instance.new("UITextSizeConstraint")local f=Instance.new("ImageButton")local g=Instance.new("ImageButton")local h=Instance.new("ImageButton")a.Name="Addon"a.Parent=editor;a.BackgroundColor3=Color3.fromRGB(30,30,30)a.BorderSizePixel=0;a.ClipsDescendants=true;a.Position=UDim2.new(0.548286617,0,0,0)a.Size=UDim2.new(0,275,0,30)a.ZIndex=100;b.Parent=a;b.AnchorPoint=Vector2.new(0.5,0.5)b.BackgroundColor3=Color3.fromRGB(50,50,50)b.BorderSizePixel=0;b.Position=UDim2.new(0.239772722,0,0.5,0)b.Size=UDim2.new(0.434545457,0,0.600000024,0)b.ZIndex=555;b.Font=Enum.Font.Code;b.PlaceholderText="Find"b.Text=""b.TextColor3=Color3.fromRGB(255,255,255)b.TextScaled=true;b.TextSize=14.000;b.TextWrapped=true;b.ClearTextOnFocus=false;c.Parent=b;c.MaxTextSize=13;d.Name="Amount"d.Parent=a;d.AnchorPoint=Vector2.new(0,0.5)d.BackgroundColor3=Color3.fromRGB(255,255,255)d.BackgroundTransparency=1.000;d.Position=UDim2.new(0.49454546,0,0.5,0)d.Size=UDim2.new(-0.534545481,200,1,0)d.ZIndex=100;d.Font=Enum.Font.Code;d.Text="3 of 5"d.TextColor3=Color3.fromRGB(255,255,255)d.TextScaled=true;d.TextSize=14.000;d.TextWrapped=true;e.Parent=d;e.MaxTextSize=15;f.Name="forward"f.Parent=a;f.AnchorPoint=Vector2.new(0.5,0.5)f.BackgroundTransparency=1.000;f.Position=UDim2.new(0.843636394,0,0.5,0)f.Size=UDim2.new(0,20,0,20)f.ZIndex=115;f.Image="rbxassetid://3926307971"f.ImageRectOffset=Vector2.new(564,284)f.ImageRectSize=Vector2.new(36,36)g.Name="back"g.Parent=a;g.AnchorPoint=Vector2.new(0.5,0.5)g.BackgroundTransparency=1.000;g.Position=UDim2.new(0.74909097,0,0.5,0)g.Size=UDim2.new(0,20,0,20)g.ZIndex=105;g.Image="rbxassetid://3926307971"g.ImageRectOffset=Vector2.new(124,324)g.ImageRectSize=Vector2.new(36,36)h.Name="close"h.Parent=a;h.AnchorPoint=Vector2.new(0,0.5)h.BackgroundTransparency=1.000;h.Position=UDim2.new(0.899999976,0,0.5,0)h.Size=UDim2.new(0,20,0,20)h.ZIndex=2000;h.Image="rbxassetid://3926305904"h.ImageRectOffset=Vector2.new(284,4)h.ImageRectSize=Vector2.new(24,24)return a
        end
        
        if dex then
            shared.gone = true;
            local editor = dex.ScriptEditor.Editor;
            local tokens = dex.ScriptEditor.Editor.Container.TextArea.Tokens;
            local open = editor.Parent.OpenScript;
            local uis = game:GetService("UserInputService")
            local panel = add(editor)
            panel.Size = UDim2.new(panel.Size.X.Scale, panel.Size.X.Offset, 0, 0)
    
            local close = function()
                panel:TweenSize(UDim2.new(panel.Size.X.Scale, panel.Size.X.Offset, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Bounce, .35, true)
            end
    
            local events = {
                getselection = function()
                    local bindable = dex.ExplorerPanel.GetSelection;
                    local items = bindable:Invoke();
                    return items;
                end
            }
        
            local looking = {
                [Enum.KeyCode.LeftControl] = true;
                [Enum.KeyCode.RightControl] = true;
                [Enum.KeyCode.F] = true;
            }
        
            local ctrls = {
                [Enum.KeyCode.LeftControl] = true;
                [Enum.KeyCode.RightControl] = true;
            }
        
            local data = {
                ["ctrl"] = false;
                ["f"] = false;
            }
        
            local reset = function()
                for key, value in pairs(data) do
                    data[key] = false;
                end
            end
        
            local pullup = function()
                reset();
                if editor.Parent.Visible then
                    panel:TweenSize(UDim2.new(panel.Size.X.Scale, panel.Size.X.Offset, 0, 30), Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, .35, true)
                end
                spawn(function()
                    wait(.35)
                    panel.TextBox:CaptureFocus()
                end)
            end
        
            local paneldata = {
                numbers = {
                    at = 0;
                    amount = 0;
                -- 0 of 0 
                };
                results = {
                -- anything found via searching.
            }
            }
        
            local textarea = editor.Container.TextArea
            local scanning = false;
            local panelopen = false;
        
            local index = function(num)
                local s, e = pcall(function()
                    if num == 0 then
                        textarea.CanvasPosition = Vector2.new(0, 0)
                    end
                    local results = paneldata.results;
                    if #results >= num then
                        textarea.CanvasPosition = Vector2.new(0, results[num].Position.Y.Offset)
                    else
                        textarea.CanvasPosition = Vector2.new(0, 0)
                    end
                end)
            end
        
            local t = 0;
            local set = function()
                t = tick();
                local cur = t;
            end
    
        
            local last = '';
            local search = function(txt, b)
                if panelopen then
                    local td = {}
                    local c = tokens:GetChildren();
                    for i = 1, #c do
                        local item = c[i];
                        if td[item.Text] then
                            if item.Position == td[item.Text][1] then
                                td[item.Text][2]:Destroy();
                            end
                        else
                            td[item.Text] = {
                                item.Position,
                                item
                            };
                        end
                    end
                
                    local s, e = pcall(function()
                        for i = 1, #paneldata.results do
                            local v = paneldata.results[i];
                            v.BackgroundTransparency = 1;
                        end
                        if txt == '' then
                            return false;
                        end
                        local results = {};
                        last = txt;
                        set()
                        local current = t;
                        paneldata.results = {}; -- resets to prevent any erroring.
                        local children = tokens:GetChildren()
                        local nextvalue = function(n, pre)
                            local t = n.Text:lower();
                            local lo = txt:lower();
                            if t:sub(1, 1) == lo:sub(#pre + 1, #pre + 1) then
                                return true;
                            end
                            return false;
                        end
                        for i = 1, #children  do
                            local value = children[i];
                            if t == current then
                                if value.Text:lower():find(txt:lower()) then
                                    table.insert(paneldata.results, value)
                        -- ignore this, I was trying to filter through the next results to allow you to use stuff like require( in the search.
                        --[[if nextvalue(children[i+1],value.Text) then
                            table.insert(paneldata.results, children[i+1])
                        end--]]
                                end
                            end
                        end
                        if t == current then
                            paneldata.numbers.amount = #paneldata.results;
                    
                            for i = 1, #paneldata.results do
                                paneldata.results[i].BackgroundColor3 = Color3.fromRGB(255, 255, 0)
                                paneldata.results[i].BackgroundTransparency = .5;
                            end
                        end
                    end)
                end
            end
            panel.close.MouseButton1Click:Connect(function()
                panelopen = false;
                panel.TextBox.Text = '';
                paneldata.numbers.amount = 0;
                paneldata.numbers.at = 0;
                    
                local c = tokens:GetChildren()
                for i = 1, #tokens:GetChildren() do
                    local v = c[i];
                    v.BackgroundTransparency = 1;
                end
                close();
            end)
        
            local add = function()
                local n = paneldata.numbers.at;
                local new = n + 1;
                if new < paneldata.numbers.amount or new == paneldata.numbers.amount then
                    paneldata.numbers.at = n + 1;
                end
            end
        
            local up = function()
                local nums = paneldata.numbers;
    
                if nums.at == nums.amount then
                    if nums.amount == 0 and nums.at == 0 then
                    else
                        add()
                    end
                else
                    add()
                end
            end
        
            local back = function()
                local nums = paneldata.numbers;
                if nums.at == 0 then
                else
                    paneldata.numbers.at = paneldata.numbers.at - 1;
                    if paneldata.numbers.at == 0 and paneldata.numbers.amount >= 1 then
                        paneldata.numbers.at = paneldata.numbers.at + 1;
                    end
                end
            end
            panel.back.MouseButton1Click:Connect(function()
                back()
            end)
            panel.forward.MouseButton1Click:Connect(function()
                up()
            end)
            spawn(function()
                game:GetService('RunService').Heartbeat:Connect(function()
                    local amount = paneldata.numbers.amount;
                    local at = paneldata.numbers.at;
                
                    if at == 0 and amount == 0 then
                        panel.Amount.Text = '';
                    else
                        panel.Amount.Text = at..' of '..amount
                    end
                end)
            end)
        
            local can = function(t)
                if #t >= 500 then
                    return false;
                end
                for i = 1, #t do
                    if t:sub(i, i) == '' or t:sub(i, i) == ' ' then
                    else
                        return true;
                    end
                end
                return false;
            end
            local val = Instance.new("IntValue")
            val.Name = 'Position'
            spawn(function()
                while wait() do
                    val.Value = paneldata.numbers.at;
                    if paneldata.numbers.amount == 0 then
                        paneldata.numbers.at = 0;
                        val.Value = paneldata.numbers.at
                    end
                    if panel.TextBox.Text == '' then
                        paneldata.numbers.amount = 0;
                        paneldata.numbers.at = 0;
                        search('')
                    end
                    if paneldata.numbers.at == 0 and paneldata.numbers.amount >= 1 then
                        paneldata.numbers.at = 1;
                    end
                end
            end)
            val.Changed:Connect(function(n)
                if not scanning then
                    index(val.Value)
                end
            end)
        
            textarea.Changed:Connect(function()
                scanning = true;
                search(panel.TextBox.Text)
                wait(.1)
                scanning = false;
            end)
        
            local last = textarea.CanvasPosition;
    
            panel.TextBox.Changed:Connect(function()
                local txt = panel.TextBox.Text
                if can(txt) then
                    search(txt)
                end
            end)
        
            panel.TextBox.FocusLost:Connect(function(ep, random)
                if ep then
                    wait()
                    up();
                    wait()
                    panel.TextBox:CaptureFocus();
                end
            end)
    
            local last;
        
            uis.InputBegan:Connect(function(input, proccessed)
                if not proccessed then
                    if input.KeyCode then           
                        if looking[input.KeyCode] then
                            if not last or data.ctrl == true then
                                if ctrls[input.KeyCode] then
                                    data.ctrl = true;
                                else
                                    data.f = true;
                                end
                                if data.f and data.ctrl and input.KeyCode == Enum.KeyCode.F then
                                    panelopen = true;
                                    pullup()
                                end
                            else
                                reset();
                            end
                        end
                    end
                end
            end)
        end
    end)
end}

Commands.RemoteSpy = {Name = "RemoteSpy", Aliases = {"RSpy"}, RequiresArgs = false, Description = "opens hydroxide penetration tool", Function = function()
    local owner = "Upbolt"
    local branch = "revision"

    local function webImport(file)
        return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/Hydroxide/%s/%s.lua"):format(owner, branch, file)), file .. '.lua')()
    end

    webImport("init")
    webImport("ui/main")
end}

Commands.AudioLogger = {Name = "AudioLogger", Aliases = {"ALogger"}, RequiresArgs = false, Description = "opens edges audio logger", Function = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/qHsSsWrY", true))()
end}

Commands.ServerInfo = {Name = "ServerInfo", Aliases = {"Info"}, RequiresArgs = false, Description = "prints info about current server", Function = function()
    local Seconds = math.floor(Services.Workspace.DistributedGameTime)
    local Minutes = math.floor(Services.Workspace.DistributedGameTime / 60)
    local Hours = math.floor(Services.Workspace.DistributedGameTime / 60 / 60)
    Seconds -= Minutes * 60
    Minutes -= Hours * 60

    local Info = "\n"
    Info ..= "LocalPlayer:\n\n   Player Id :\t\t"
    Info ..= tostring(LocalPlayer.UserId) .. "\n   Appearance :\t\t"
    Info ..= tostring(LocalPlayer.CharacterAppearanceId) .. "\n\nRunTime:\n\n"
    Info ..= "   Hour(s) :\t\t" .. tostring(Hours) .. "\n   Minutes :\t\t" .. tostring(Minutes) .. "\n   Seconds :\t\t" .. tostring(Seconds) .. "\n\n"
    Info  ..= "Statistics:\n\n   Current Players :\t"
    Info ..= tostring(#Services.Players:GetPlayers()) .. "\n   Max Players :\t"
    Info ..= tostring(Services.Players.MaxPlayers) .. "\n   Place Id :\t\t"
    Info ..= tostring(game.PlaceId) .. "\n   Job Id :\t\t"
    Info ..= tostring(game.JobId) .. "\n   Place Name :\t\t"
    Info ..= Services.MarketplaceService:GetProductInfo(game.PlaceId).Name
    Info ..= "\n"

    rconsoleprint(Info)
end}

Commands.JobId = {Name = "JobId", Aliases = nil, RequiresArgs = false, Description = "prints the game's current job id", Function = function()
    rconsoleprint("\n" .. tostring(game.JobId) .. "\n")
end}

Commands.Rejoin = {Name = "Rejoin", Aliases = {"RJ"}, RequiresArgs = false, Description = "rejoins the game", Function = function()
    Services.TeleportService:Teleport(game.PlaceId, LocalPlayer)
end}

Commands.AutoRejoin = {Name = "AutoRejoin", Aliases = {"AutoRJ"}, RequiresArgs = false, Description = "automatically rejoins server if you get kicked or disconnected", Function = function()
    local PromptOverlay = Services.CoreGui..RobloxPromptGui.promptOverlay
    PromptOverlay.ChildAdded:Connect(function(Child)
        if Child.Name == "ErrorPrompt" then
            RunCommand(Commands.Rejoin)
        end
    end)
end}

Commands.ServerHop = {Name = "ServerHop", Aliases = {"SHop"}, RequiresArgs = false, Description = "teleports you to a different server", Function = function()
    local ServerList = {}

    for _, Server in next, Services.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100")).data do
        if type(Server) == "table" and Server.maxPlayers > Server.playing and Server.id ~= game.JobId then
            table.insert(ServerList, Server)
        end
    end

    if #ServerList > 0 then
        Services.TeleportService:TeleportToPlaceInstance(game.PlaceId, ServerList[math.random(#ServerList)])
    else
        rconsoleprint("\ncouldn't find a server\n")
    end
end}

Commands.GameTeleport = {Name = "GameTeleport", Aliases = {"GameTP"}, RequiresArgs = true, Description = "joins a game by id", Function = function(PlaceId)
    Services.TeleportService:Teleport(PlaceId)
end}

Commands.AntiIdle = {Name = "AntiIdle", Aliases = {"AntiAfk"}, RequiresArgs = false, Description = "prevents game from kicking you for being idle/afk", Function = function()
    local GC = getconnections or get_signal_cons; if GC then
        for _, Connection in next, GC(LocalPlayer.Idled) do
            if Connection["Disable"] then
                Connection["Disable"](Connection)
            elseif Connection["Disconnect"] then
                Connection["Disconnect"](Connection)
            end
        end
    end
end}

Commands.DataLimit = {Name = "DataLimit", Aliases = nil, RequiresArgs = true, Description = "set outgoing kbps limit", Function = function(Limit)
    if tonumber(Limit) then
        Services.NetworkClient:SetOutgoingKBPSLimit(Limit)
    end
end}

Commands.ReplicationLag = {Name = "ReplicationLag", Aliases = {"Backtrack"}, RequiresArgs = true, Description = "set IncomingReplicationLag", Function = function(Lag)
    if tonumber(Lag) then
        Services.NetworkClient.IncomingReplicationLag = Lag
    end
end}

Commands.CreatorId = {Name = "CreatorId", Aliases = {"Creator"}, RequiresArgs = false, Description = "prints the creator's id", Function = function()
    if game.CreatorType == Enum.CreatorType.User then
        rconsoleprint("\n".. game.CreatorId .. "\n")
    elseif game.CreatorType == Enum.CreatorType.Group then
        local OwnerId = Services.GroupService:GetGroupInfoAsync(game.CreatorId).Owner.Id
        rconsoleprint("\n" .. OwnerId .. "\n")
    end
end}

Commands.SetCreatorId = {Name = "SetCreatorId", Aliases = {"SetCreator"}, RequiresArgs = false, Description = "sets your userid to the creator's id", Function = function()
    if game.CreatorType == Enum.CreatorType.User then
        LocalPlayer.UserId = game.CreatorId
    elseif game.CreatorType == Enum.CreatorType.Group then
        LocalPlayer.UserId = Services.GroupService:GetGroupInfoAsync(game.CreatorId).Owner.Id
    end
end}

Commands.NoPrompts = {Name = "NoPrompts", Alises = {"NoPurchasePrompts"}, RequiresArgs = false, Description = "prevents the game from showing purchase/premium prompts", Function = function()
    Services.CoreGui.PurchasePrompt.Enabled = false
end}

Commands.ShowPrompts = {Name = "ShowPrompts", Aliases = {"ShowPurchasePrompts"}, RequiresArgs = false, Description = "allows the game to show purchase/premium prompts", Function = function()
    Services.CoreGui.PurchasePrompt.Enabled = true
end}

Commands.Enable = {Name = "Enable", Alises = nil, RequiresArgs = true, Description = "toggles visibility of coregui items", Function = function(Item)
    if Item:lower() == "inventory" or Item:lower() == "backpack" then
        Services.StarterGui:SetCoreGuiEnabled("Backpack", true)
    elseif Item:lower() == "playerlist" then
        Services.StarterGui:SetCoreGuiEnabled("PlayerList", true)
    elseif Item:lower() == "chat" then
        Services.StarterGui:SetCoreGuiEnabled("Chat", true)
    elseif Item:lower() == "all" then
        Services.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true)
    end
end, IgnoreSpecialPlayerCases = true}

Commands.Disable = {Name = "Disable", Aliases = nil, RequiresArgs = true, Description = "toggles visibility of coregui items", Function = function(Item)
    if Item:lower() == "inventory" or Item:lower() == "backpack" then
        Services.StarterGui:SetCoreGuiEnabled("Backpack", false)
    elseif Item:lower() == "playerlist" then
        Services.StarterGui:SetCoreGuiEnabled("PlayerList", false)
    elseif Item:lower() == "chat" then
        Services.StarterGui:SetCoreGuiEnabled("Chat", false)
    elseif Item:lower() == "all" then
        Services.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
    end
end, IgnoreSpecialPlayerCases = true}

local SpecialPlayerCases = {
    all = function()
        return Services.Players:GetPlayers()
    end,

    others = function(Speaker)
        local Players = {}

        for _, Player in next, Services.Players:GetPlayers() do
            if Player ~= Speaker then
                table.insert(Players, Player)
            end
        end

        return Players
    end,

    me = function(Speaker)
        return {Speaker}
    end,

    random = function(Speaker)
        local Players = Services.Players:GetPlayers()

        return {Players[math.random(#Players)]}
    end,

    allies = function(Speaker)
        local Players = {}
        local Team = Speaker.Team

        for _, Player in next, Services.Players:GetPlayers() do
            if Player.Team == Team then
                table.insert(Players, Player)
            end
        end

        return Players
    end,

    enemies = function(Speaker)
        local Players = {}
        local Team = Speaker.Team

        for _, Player in next, Services.Players:GetPlayers() do
            if Player.Team ~= Team then
                table.insert(Players, Player)
            end
        end

        return Players
    end,

    friends = function(Speaker)
        local Players = {}

        for _, Player in next, Services.Players:GetPlayers() do
            if Player ~= Speaker and Player:IsFriendsWith(Speaker.UserId) then
                table.insert(Players, Player)
            end
        end

        return Players
    end,

    nonfriends = function(Speaker)
        local Players = {}

        for _, Player in next, Services.Players:GetPlayers() do
            if Player ~= Speaker and not Player:IsFriendsWith(Speaker.UserId) then
                table.insert(Players, Player)
            end
        end

        return Players
    end,
    
    bacons = function(Speaker)
        local Players = {}
        for _, Player in next, Services.Players:GetPlayers() do
            if Player.Character and (Player.Character:FindFirstChild("Pal Hair") or Player.Character:FindFirstChild("Kate Hair")) then
                table.insert(Players, Player)
            end
        end

        return Players
    end,

    nearest = function(Speaker)
        if Speaker.Character and Speaker.Character:FindFirstChild("HumanoidRootPart") then
            local ShortestDistance, NearestPlayer = math.huge
            
            for _, Player in next, Services.Players:GetPlayers() do
                if Player ~= Speaker and Player.Character then
                    local Distance = (Player.Character.HumanoidRootPart.Position - Speaker.Character.HumanoidRootPart.Position).Magnitude

                    if Distance < ShortestDistance then
                        ShortestDistance = Distance
                        NearestPlayer = {Player}
                    end
                end
            end

            return NearestPlayer
        end
    end,

    farthest = function(Speaker)
        if Speaker.Character and Speaker.Character:FindFirstChild("HumanoidRootPart") then
            local LongestDistance, FarthestPlayer = 0

            for _, Player in next, Services.Players:GetPlayers() do
                if Player ~= Speaker and Player.Character then
                    if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                        local Distance = (Player.Character.HumanoidRootPart.Position - Speaker.Character.HumanoidRootPart.Position).Magnitude

                        if Distance > LongestDistance then
                            LongestDistance = Distance
                            FarthestPlayer = {Player}
                        end
                    end
                end
            end

            return FarthestPlayer
        end
    end,

    alive = function()
        local Players = {}

        for _, Player in next, Services.Players:GetPlayers() do
            if Player.Character and Player.Character:FindFirstChildOfClass("Humanoid") and Player.Character.Humanoid.Health > 0 then
                table.insert(Players, Player)
            end
        end

        return Players
    end,

    dead = function()
        local Players = {}

        for _, Player in next, Services.Players:GetPlayers() do
            if not Player.Character or not Player.Character:FindFirstChildOfClass("Humanoid") or Player.Character.Humanoid.Health <= 0 then
                table.insert(Players, Player)
            end
        end

        return Players
    end
}
SpecialPlayerCases.closest = SpecialPlayerCases.nearest
SpecialPlayerCases.team = SpecialPlayerCases.allies
SpecialPlayerCases.nonteam = SpecialPlayerCases.Enemies

local function FindPlayer(Name)
    for _, Player in next, Services.Players:GetPlayers() do
        if Player.Name:lower():sub(1, #Name) == Name:lower() then
            return Player
        end
    end
end

local function SearchCommand(CommandName)
    for Command, Properties in next, Commands do
        Command = Command:lower()
        if Command == CommandName then
            return Command, Properties
        else
            if type(Properties.Aliases) == "table" then
                for _, Alias in next, Properties.Aliases do
                    if Alias:lower() == CommandName then
                        return Command, Properties
                    end
                end
            end
        end
    end
end

local function RunCommand(Command, Args)
    if Args[1] then
        FoundPlayer = FindPlayer(Args[1])
        if FoundPlayer then
            Args = {{FoundPlayer}}
        elseif not Command.IgnoreSpecialPlayerCases and type(SpecialPlayerCases[Args[1]:lower()]) == "function" then
            Args = {SpecialPlayerCases[Args[1]:lower()](LocalPlayer)}
        end
    end

    local Success, Error = pcall(function()
        Command.Function(table.unpack(Args))
    end)

    if not Success then
        if printconsole then
            printconsole(Error)
        elseif printoutput then
            printoutput(Error)
        end
    end
end

local function HandleInput(Input)
    Input = Input:lower()

    local Args = string.split(Input, " ")
    local CommandName, Properties = SearchCommand(table.remove(Args, 1))

    if CommandName and (not Properties.RequiresArgs or (Properties.RequiresArgs and #Args > 0)) then
        RunCommand(Properties, Args)
    end
end

local Name = string.format("NibberHook [Version %s]", CurrentVersion)
rconsoleprint(Name .. "\n\n")
rconsolename(Name)

task.spawn(function()
    while task.wait() do
        rconsoleprint("C:\\Users\\" .. LocalPlayer.Name .. ">")
        HandleInput(rconsoleinput())
        rconsoleprint("\n")
    end
end)