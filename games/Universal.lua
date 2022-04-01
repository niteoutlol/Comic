print("Comic - Universal")

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

function startsWith(String, Start)
	return string.sub(String,1,string.len(Start))==Start
 end

local character = window.addPage("Character", 5012544693)
local movement = character:addSection("Movement")
local teleportation = character:addSection("Teleportation")

movement:addSlider(1, 16, 256, function(value)
	game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = value
end)

movement:addSlider(1, 50, 250, function(value)
	game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").JumpPower = value
end)

-- I have tried adding so you dont have to write the entire name just a little of the name

teleportation:addTextbox("Player Name", "Builderman", function(value, focusLost)
	if focusLost then
		if game:GetService("Players"):FindFirstChild(value) then
			game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Players"):FindFirstChild(value).Character:WaitForChild("HumanoidRootPart").CFrame
		else
			for i, v in pairs(game:GetService("Players"):GetChildren()) do
				if startsWith(v, value) then
					game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Players"):FindFirstChild(v).Character:WaitForChild("HumanoidRootPart").CFrame
				end
			end
			window:Notify("Comic", value .. " is not a valid player.")
		end
	end
end)