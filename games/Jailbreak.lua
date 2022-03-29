print("Comic - Jailbreak")

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

movement:addToggle("WalkSpeed", false, function(value)
    while value do
        game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = shared.cwalkspeed
    end
end)
movement:addSlider("WalkSpeed", 16, 16, 256, function(value)
    shared.cwalkspeed = value
end)