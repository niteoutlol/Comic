local function loadGame()
    local URL = "https://raw.githubusercontent.com/VeriorGit/Comic/master/games"

    local games = {
        [606849621] = "Jailbreak",
    }

    for i,v in next, games do
        games[i] = table.concat(v:split(' '), '_')
    end

    local name = games[game.PlaceId] or games[game.GameId]

    game.CoreGui:WaitForChild("Comic"):Destroy()
    return loadstring(game:HttpGet(URL .. "/" .. (name or "Universal") .. ".lua", true))()
end

local key = "fNX29uLmZ3_B6nK3Z3eya"

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local window = library.new("Comic", 5013109572)

local themes = {
	Background = Color3.fromRGB(24, 24, 24),
	Glow = Color3.fromRGB(255, 60, 62),
	Accent = Color3.fromRGB(255, 60, 62),
	LightContrast = Color3.fromRGB(20, 20, 20),
	DarkContrast = Color3.fromRGB(14, 14, 14),  
	TextColor = Color3.fromRGB(255, 255, 255)
}

local page = window:addPage("Loader", 5012544693)
local keysystem = page:addSection("Keysystem")
local selfdestruct = page:addSection("Self Destruct")

keysystem:addButton("Get Key", function()
    window:Notify("Comic", "https://dsc.gg/comic")
end)

shared.cinputtedKey = ""

keysystem:addTextbox("Comic Key", "Default", function(value, focusLost)
    if focusLost then
        print("Keysystem", value)
        shared.cinputtedKey = value
    end
end)

keysystem:addButton("Verify", function()
    if shared.cinputtedKey == key then
        window:Notify("Comic", "Correct Key", function(value)
            if value then
                loadGame()
            else
                loadGame()
            end
        end)
    else
        window:Notify("Comic", "Invalid Key")
    end
end)

selfdestruct:addButton("Self Destruct", function()
    game.CoreGui:WaitForChild("Comic"):Destroy()
end)