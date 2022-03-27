repeat task.wait() until game:IsLoaded() == true
local customdir = "comic/"
local betterisfile = function(file)
	local suc, res = pcall(function() return readfile(file) end)
	return suc and res ~= nil
end

local function GetURL(scripturl)
	if shared.VapeDeveloper then
		if not betterisfile("comic/"..scripturl) then
			error("File not found : comic/"..scripturl)
		end
		return readfile("comic/"..scripturl)
	else
		local res = game:HttpGet("https://raw.githubusercontent.com/VeriorGit/ComicForRoblox/main/"..scripturl, true)
		assert(res ~= "404: Not Found", "File not found")
		return res
	end
end

if not (getasset and requestfunc and queueteleport) then
	print("Comic is not supported with your exploit.")
	return
end

if shared.ComicExists then
    error("Comic is already running!")
else
    shared.ComicExists = true
end

if isfolder(customdir:gsub("/", "")) == false then
    makefolder(customdir:gsub("/", ""))
end

if isfolder("comic") == false then
    makefolder("comic")
end

if isfolder("games") == false then
    makefolder("games")
end

if not betterisfile("comic/games/606849621.lua") then
    writefile("comic/games/606849621.lua", ("loadstring(game:HttpGet('https://raw.githubusercontent.com/VeriorGit/ComicForRoblox/main/games/606849621.lua', true))()"))
end

local function checkSupport()
    if game.PlaceId == 606849621 then
        return "Supported"
    else
        return "not Supported"
    end
end


local lib = loadstring(game:HttpGet("https://pastebin.com/raw/WVe25Hr0"))()
local win = lib:Window("Comic", Color3.fromRGB(255, 60, 62), Enum.KeyCode.RightShift)

local infoTab = win:Tab("Info")
infoTab:Label("Comic Roblox Hub")
infoTab:Label("Supported Games: Jailbreak")

local injectTab = win:Tab("Inject")
injectTab:Label("Press Inject to inject Comic")
injectTab:Label("Game is ".. checkSupport())
injectTab:Button("Inject", function()
    if game.PlaceId == 606849621 then -- Check if the current game is Jailbreak
        -- Inject the script for Jailbreak.
        lib:Destroy()
        loadstring(GetURL("games/606849621.lua"))
    end
end)
