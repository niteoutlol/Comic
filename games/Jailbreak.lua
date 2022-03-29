print("Comic - Jailbreak")

local hrpc = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame

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

local character = window:addPage("Character", 5012544693)
local movement = character:addSection("Movement")

shared.cwalkspeed = 16 

-- Dette scriptet cræsjer gamet når man bruker kato api

movement:addToggle("WalkSpeed", nil, function(value)
    if value then
        while value do
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = shared.cwalkspeed
            wait()
        end
        game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 16
    else
        game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 16
    end
end)
movement:addSlider("WalkSpeed", 16, 16, 256, function(value)
    shared.cwalkspeed = value
end)

local teleportation = window:addPage("Teleportation", 5012544693)
local teleport = teleportation:addSection("Teleport")

teleport:addButton("tp", function()
    repeat wait() hrpc = CFrame.new(hrcp =+ 1, 300, hrcp =+ 1) until hrcp == CFrame.new(20, 300, 70)
end)
