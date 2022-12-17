-->>> Reanimation Rewrite v1 by H3x0R-OpenGamerTips <<<--
-- Changelog:
--   [+] Smaller and cleaner script. (duh, its a full rewrite)
--   [+] Metatable spoofing for the character so you can use basic admins with the script.
--   [+] Reset / Void death support.

local UseR6 = true -- For use in R15 games (Attachments will be different.)
local UseAnimation = true -- SpoofClientCharacter must be true.
local SpoofClientCharacter = true -- Makes Player.Character return your clone. If you want animations do true.
local CustomResetCharacter = true
local ResetCharacterInVoid = true
local CanCharacterCollide = true
----------------------------------------------------------------------------------------------------------------------------------
loadstring(game:HttpGet("https://raw.githubusercontent.com/OpenGamerTips/TextBin/master/primary_ownership_isnt_patched.lua"))()
wait(0.2)
-- Define Network Functions
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local StartCharacter = Player.Character
local HRP = StartCharacter:WaitForChild("HumanoidRootPart")
local RespawnCalled = false

HRP.Anchored = true -- no more trouble with ppl flinging u everywhere
function CreateWeldSimulation(parent, PartOrAttachment0, PartOrAttachment1, angle)
    local APos, RPos = nil
    local a0, a1 = nil

	local Container = parent:FindFirstChild("WeldSimulations")
	if not Container then
		Container = Instance.new("Folder", parent)
		Container.Name = "WeldSimulations"
	end

	local ctr = 0
	for _, __ in pairs(Container:GetChildren()) do
		ctr = ctr + 1
	end

	if PartOrAttachment0:IsA("Attachment") and PartOrAttachment1:IsA("Attachment") then
		a0 = PartOrAttachment0
		a1 = PartOrAttachment1
    elseif PartOrAttachment0:IsA("BasePart") and PartOrAttachment1:IsA("BasePart") then
        if not angle then
			a0 = Instance.new("Attachment", PartOrAttachment0)
			a0.Name = PartOrAttachment0.Name:gsub("%s+", "").."Joint"

			a1 = Instance.new("Attachment", PartOrAttachment1)
			a1.Name = PartOrAttachment0.Name:gsub("%s+", "").."Joint"
        else
			a0 = Instance.new("Attachment", PartOrAttachment0)
			a0.Name = PartOrAttachment0.Name:gsub("%s+", "").."Joint"
            a0.Rotation = angle

			a1 = Instance.new("Attachment", PartOrAttachment1)
			a1.Name = PartOrAttachment0.Name:gsub("%s+", "").."Joint"
        end
    else
        return false
    end

	APos = Instance.new("AlignPosition")
	APos.Name = "PosWeld"..tostring(ctr)
    APos.ReactionForceEnabled = true
    APos.RigidityEnabled = true
	APos.Attachment0 = a0
	APos.Attachment1 = a1
    APos.Parent = Container

    RPos = Instance.new("AlignOrientation")
	RPos.ReactionTorqueEnabled = true
	RPos.Name = "RotWeld"..tostring(ctr)
    RPos.RigidityEnabled = true
    RPos.Attachment0 = a0
    RPos.Attachment1 = a1
    RPos.Parent = Container

    return APos, RPos
end

function FindSecondAttachment(Char, att2)
    for _, att in pairs(Char:GetDescendants()) do
        if att:IsA("Attachment") and att.Name == att2.Name then
            return att
        end
    end
end

function FindSecondPartRelation(Char, prt2)
	for _, prt in pairs(Char:GetChildren()) do
        if prt:IsA("BasePart") and prt.Name == prt2.Name then
            return prt
        end
    end
end

function WeldHat(hat, char)
	local attachmentA = hat.Handle:FindFirstChildWhichIsA("Attachment")
	local attachmentB = FindSecondAttachment(char, attachmentA)

	hat.Handle.CanCollide = false
	hat.Handle.Massless = true
	if hat.Handle:FindFirstChildWhichIsA("TouchTransmitter") then
		hat.Handle:FindFirstChildWhichIsA("TouchTransmitter"):Destroy()
	end

	local W1, W2 = CreateWeldSimulation(hat, attachmentA, attachmentB)
	
	local FakeWeld = Instance.new("Weld", hat.Handle)
	FakeWeld.Name = "AccessoryWeld"

	-- disgusting workaround
	FakeWeld.Parent.ChildRemoved:Connect(function(a)
		if a == FakeWeld then
			W1:Destroy()
			W2:Destroy()
		end
	end)
end

local UI = {}
UI.Reanimation = Instance.new("ScreenGui")
UI.Frame = Instance.new("Frame")
UI.Label = Instance.new("TextLabel")

UI.Reanimation.Name = math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9)
local _Success = pcall(function() UI.Reanimation.Parent = game:GetService("CoreGui") end)
if not _Success then
	UI.Reanimation.Parent = Player.PlayerGui
end
UI.Reanimation.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

UI.Frame.Name = "Intro"
UI.Frame.Parent = UI.Reanimation
UI.Frame.AnchorPoint = Vector2.new(0.5, 0.5)
UI.Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
UI.Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
UI.Frame.BorderSizePixel = 0
UI.Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
UI.Frame.Size = UDim2.new(0, 500, 0, 80)

UI.Label.Name = "Text"
UI.Label.Parent = UI.Frame
UI.Label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
UI.Label.BackgroundTransparency = 1.000
UI.Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
UI.Label.BorderSizePixel = 0
UI.Label.Position = UDim2.new(0, 0, 0.1875, 0)
UI.Label.Size = UDim2.new(0, 500, 0, 50)
UI.Label.Font = Enum.Font.SourceSansLight
UI.Label.Text = ""
UI.Label.TextColor3 = Color3.fromRGB(255, 255, 255)
UI.Label.TextScaled = true
UI.Label.TextSize = 14.000
UI.Label.TextWrapped = true

UI.Blur = nil
UI.TS = game:GetService("TweenService")
UI.TopY = workspace.CurrentCamera.ViewportSize.Y
UI.Frame.Position = UDim2.new(0.5, 0, 0, -UI.TopY - 30)
	
function UI.Spell(Text, Delay)
	UI.Label.Text = ""
	for Char, _ in string.gmatch(Text, ".") do
		UI.Label.Text = UI.Label.Text..Char
		wait(Delay)
	end
	
	return true
end
	
function UI.Begin()
	UI.Blur = Instance.new("BlurEffect")
	UI.Blur.Size = 0
	UI.Blur.Name = ""
	UI.Blur.Parent = game:GetService("Lighting")
	
	UI.TS:Create(UI.Frame, TweenInfo.new(1), {
		Position = UDim2.new(0.5, 0, 0.5, 0)
	}):Play()
		
	UI.TS:Create(UI.Blur, TweenInfo.new(0.5), {
		Size = 25
	}):Play()
	
	wait(2)
	return
end
	
function UI.End()
	UI.TS:Create(UI.Frame, TweenInfo.new(1), {
		Position = UDim2.new(0.5, 0, 0, UI.TopY + 30)
	}):Play()

	UI.TS:Create(UI.Blur, TweenInfo.new(0.5), {
		Size = 0
	}):Play()

	coroutine.wrap(function()
		wait(2)
		--// UI.Reanimation:Destroy() (Forgot this was deleting the UI)
		UI.Blur:Destroy()
	end)()

	return
end

-- Start
local SavedType = workspace.CurrentCamera.CameraType
workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable

local CamOffset = Vector3.new(0, 0, -10)
workspace.CurrentCamera.CFrame = (HRP.CFrame * CFrame.new(CamOffset))
workspace.CurrentCamera.CFrame = (workspace.CurrentCamera.CFrame * CFrame.fromEulerAnglesXYZ(0, 550, 0))
UI.Begin()
UI.Spell("Reanimation Rewrite v1", 0.05)
wait(0.5)
UI.Spell("Cloning Character", 0.04)

local HatsToReattach = {}
for _, hair in pairs(StartCharacter:GetChildren()) do
    if hair.ClassName == "Accessory" then
        hair.Handle.Massless = true
		hair.Handle.CanCollide = false

        table.insert(HatsToReattach, hair)
    end
end

local EndCharacter;
local IsR6 = false
IsR6 = (StartCharacter.Humanoid.RigType == Enum.HumanoidRigType.R6)
if not UseR6 then
    StartCharacter.Archivable = true
    EndCharacter = StartCharacter:Clone()
    EndCharacter.Name = math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9)
else
    EndCharacter = game:GetObjects("rbxassetid://1561389244")[1]
    EndCharacter.Name = math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9)..math.random(0, 9)
end

for i,v in pairs(EndCharacter:GetChildren()) do
    if v:IsA("Accessory") or v:IsA("BaseScript") or v:IsA("ModuleScript") then
        v:Destroy()
    end
end

for i,v in pairs(EndCharacter:GetDescendants()) do
    if v:IsA("BasePart") then
        v.Transparency = 1

        if v.Name == "Head" and v:FindFirstChild("face") then
            v.face:Destroy()
        end
	elseif v:IsA("ForceField") then
		v:Destroy()
    end
end

EndCharacter:SetPrimaryPartCFrame(HRP.CFrame)
EndCharacter.Parent = workspace
workspace.CurrentCamera.CameraSubject = EndCharacter.Humanoid

local MovePart = Instance.new("Part", workspace)
MovePart.CanCollide = false
MovePart.Transparency = 1

local MoveConnection;
MoveConnection = game:GetService("RunService").Heartbeat:Connect(function()
	if RespawnCalled then MoveConnection:Disconnect() return end
	local Vector = workspace.CurrentCamera.CFrame.lookVector
	local _HRP = EndCharacter.HumanoidRootPart

	MovePart.Position = _HRP.Position
	MovePart.CFrame = CFrame.new(MovePart.Position, Vector3.new(Vector.X * 9999, Vector.Y, Vector.Z * 9999))
end)

wait(0.5)
UI.Spell("Bypassing Respawn", 0.04)

local FakeChar = Instance.new("Model") -- permadeath
FakeChar.Name = ""

local FakeTorso =  Instance.new("Part", FakeChar)
FakeTorso.Name = "Torso"
FakeTorso.CanCollide = false
FakeTorso.Anchored = true

local FakeHead  = Instance.new("Part", FakeChar)
FakeHead.Name = "Head"
FakeHead.Anchored = true
FakeHead.CanCollide = false

local FakeHumanoid = Instance.new("Humanoid", FakeChar)
FakeHumanoid.Name = "Humanoid"

FakeTorso.Position = Vector3.new(0, 9e9, 0)
FakeHead.Position = Vector3.new(0, 9e8, 0)
FakeChar.Parent = workspace

game:GetService("Players").LocalPlayer.Character = FakeChar
wait(5)
game:GetService("Players").LocalPlayer.Character = StartCharacter
FakeChar:Destroy() -- bye lol
wait(6)
HRP.Anchored = false
StartCharacter.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
HRP = EndCharacter:WaitForChild("HumanoidRootPart")

UI.Spell("Finishing Up", 0.04)

function CreateR6toR15Attachments(BP, RigNames)
    if BP.Name == "Torso" then
        local A0 = Instance.new("Attachment")
        A0.Position = Vector3.new(0, 0, 0)
        A0.Name = "TopAlignment"
            
        local A1 = Instance.new("Attachment")
        A1.Position = Vector3.new(0, -0.8, 0)
        A1.Name = "BottomAlignment"
        
        for i,v in pairs(RigNames) do
            if i == 1 then
                CreateWeldSimulation(EndCharacter, A0, Instance.new("Attachment", StartCharacter[v]))
            else
                CreateWeldSimulation(EndCharacter, A1, Instance.new("Attachment", StartCharacter[v]))
            end
        end
    else
        local A0 = Instance.new("Attachment")
        A0.Position = Vector3.new(0, -0.3, 0)
        A0.Name = "MidAlignment"
            
        local A1 = Instance.new("Attachment")
        A1.Position = Vector3.new(0, -0.8, 0)
        A1.Name = "BottomAlignment"
            
        local A2 = Instance.new("Attachment")
        A2.Position = Vector3.new(0, 0.4, 0)
        A2.Name = "TopAlignment"
        
        A0.Parent = BP
        A1.Parent = BP
        A2.Parent = BP
        
        for i,v in pairs(RigNames) do
            if i == 1 then
                CreateWeldSimulation(EndCharacter, A2, Instance.new("Attachment", StartCharacter[v]))
            elseif i == 2 then
                CreateWeldSimulation(EndCharacter, A0, Instance.new("Attachment", StartCharacter[v]))
            else
                CreateWeldSimulation(EndCharacter, A1, Instance.new("Attachment", StartCharacter[v]))
            end
        end
    end
end

function SetupR6withR15(Char)
    if UseR6 then
        local LA = Char["Left Arm"]
        local RA = Char["Right Arm"]
        
        local LL = Char["Left Leg"]
        local RL = Char["Right Leg"]
        
        local TR = Char["Torso"]
        local HR = Char["HumanoidRootPart"]
        local HR1 = FindSecondPartRelation(StartCharacter, HR)
        
        local HD = Char["Head"]
        local HD1 = FindSecondPartRelation(StartCharacter, HD)
        
        CreateR6toR15Attachments(LA, {"LeftUpperArm", "LeftLowerArm", "LeftHand"})
        CreateR6toR15Attachments(RA, {"RightUpperArm", "RightLowerArm", "RightHand"})
        
        CreateR6toR15Attachments(LL, {"LeftUpperLeg", "LeftLowerLeg", "LeftFoot"})
        CreateR6toR15Attachments(RL, {"RightUpperLeg", "RightLowerLeg", "RightFoot"})
        
        CreateR6toR15Attachments(TR, {"UpperTorso", "LowerTorso"})
        
		HR.CustomPhysicalProperties = PhysicalProperties.new(3.2, 0.3, 0.5, 1, 1)
		local A0 = Instance.new("Attachment", HR)
		A0.Name = "HRPAttachment"

		local A1 = Instance.new("Attachment", HR1)
		A0.Name = "HRPAttachment"
		
        APos = Instance.new("AlignPosition", HR)
    	APos.Name = "HRPJoint"
        APos.ReactionForceEnabled = true
    	APos.RigidityEnabled = true
    	APos.Attachment0 = A0
    	APos.Attachment1 = A1
    	
    	CreateWeldSimulation(EndCharacter, HD, HD1)
    else
        error("You need a R6 clone.")
    end
end

if UseR6 and not IsR6 then
    SetupR6withR15(EndCharacter)
else
    for _, P0 in pairs(EndCharacter:GetChildren()) do
    	if P0:IsA("BasePart") then
    		P0.CustomPhysicalProperties = PhysicalProperties.new(3.2, 0.3, 0.5, 1, 1)
            
    		local P1 = FindSecondPartRelation(StartCharacter, P0)
			if P0.Name == "HumanoidRootPart" then
				local A0 = Instance.new("Attachment", P0)
				A0.Name = "HRPAttachment"

				local A1 = Instance.new("Attachment", P1)
				A0.Name = "HRPAttachment"

    			APos = Instance.new("AlignPosition", P0)
    			APos.Name = "HRPJoint"
    		    APos.ReactionForceEnabled = true
    		    APos.RigidityEnabled = true
    		    APos.Attachment0 = A0
    			APos.Attachment1 = A1
    		else
    			CreateWeldSimulation(EndCharacter, P0, P1)
    		end
    	end
    end
end

if not CanCharacterCollide then
	RunService.Stepped:Connect(function()
		for i,v in pairs(EndCharacter:GetDescendants()) do
			if v:IsA("BasePart") then
				v.CanCollide = false
			end
		end
	end)
end

RunService.Stepped:Connect(function()
	for i,v in pairs(StartCharacter:GetDescendants()) do
		if v:IsA("BasePart") then
			v.CanCollide = false
		end
	end
end)


for _, hat in pairs(HatsToReattach) do
    if hat.Handle:FindFirstChildWhichIsA("Weld") then
        hat.Handle:FindFirstChildWhichIsA("Weld"):Destroy()
    end
	
	hat.Parent = EndCharacter
	WeldHat(hat, EndCharacter)
end

local UIS, Forward, Left, Right, Back, Jumping = game:GetService("UserInputService"), false, false, false, false, false
UIS.InputBegan:Connect(function(Key, gameProcessed)
	if not gameProcessed and Key.UserInputType == Enum.UserInputType.Keyboard then
		local Key = Key.KeyCode

		if Key == Enum.KeyCode.W then
			Forward = true
		elseif Key == Enum.KeyCode.A then
			Left = true
		elseif Key == Enum.KeyCode.D then
			Right = true
		elseif Key == Enum.KeyCode.S then
			Back = true
		elseif Key == Enum.KeyCode.Space then
			Jumping = true
		end
	end
end)

UIS.InputEnded:Connect(function(Key)
	if Key.UserInputType == Enum.UserInputType.Keyboard then
		local Key = Key.KeyCode

		if Key == Enum.KeyCode.W then
			Forward = false
		elseif Key == Enum.KeyCode.A then
			Left = false
		elseif Key == Enum.KeyCode.D then
			Right = false
		elseif Key == Enum.KeyCode.S then
			Back = false
		elseif Key == Enum.KeyCode.Space then
			Jumping = false
		end
	end
end)

function Move(X, Y, Z)
	MovePart.CFrame = MovePart.CFrame * CFrame.new(-X, Y, -Z)
	EndCharacter.Humanoid.WalkToPoint = MovePart.Position
end

coroutine.wrap(function()
	while game:GetService("RunService").RenderStepped:Wait() do
		if RespawnCalled == true then break end

		if Forward then
			Move(0, 0, 1e4)
		end
	
		if Back then
			Move(0, 0, -1e4)
		end
	
		if Left then
			Move(1e4, 0, 0)
		end
	
		if Right then
			Move(-1e4, 0, 0)
		end
	
		if Jumping then
			EndCharacter.Humanoid.Jump = true
		end

		if not Forward and not Back and not Left and not Right and not Jumping then
			Move(0, 0, 0)
		end
	end
end)()

local ToSpoof = {
	game:GetService("Players").LocalPlayer,
	"Character",
	EndCharacter
}

function Respawn()
	if RespawnCalled == false then
		RespawnCalled = true
		UI.Frame.Position = UDim2.new(0.5, 0, 0, -UI.TopY - 30)
		UI.Spell("", 0.01)
		UI.Begin()
		UI.Spell("Respawning", 0.04)
		local FakeChar = Instance.new("Model")
		FakeChar.Name = ""

		local FakeTorso =  Instance.new("Part", FakeChar)
		FakeTorso.Name = "Torso"
		FakeTorso.CanCollide = false
		FakeTorso.Anchored = true

		local FakeHead  = Instance.new("Part", FakeChar)
		FakeHead.Name = "Head"
		FakeHead.Anchored = true
		FakeHead.CanCollide = false

		local FakeHumanoid = Instance.new("Humanoid", FakeChar)
		FakeHumanoid.Name = "Humanoid"

		FakeTorso.Position = Vector3.new(0, 9e9, 0)
		FakeHead.Position = Vector3.new(0, 9e8, 0)
		FakeChar.Parent = workspace

		game:GetService("Players").LocalPlayer.Character = FakeChar
		wait(5)
		--game:GetService("Players").LocalPlayer.Character = StartCharacter
		FakeChar:Destroy() -- bye lol
		UI.End()
		wait(Players.RespawnTime)
		EndCharacter:Destroy() -- cya
		game:GetService("CoreGui").RobloxGui.SettingsShield.SettingsShield.MenuContainer.PageViewClipper.PageView.PageViewInnerFrame.ResetCharacter.ResetCharacterText.ResetButtonContainer.ResetCharacterButton.ResetCharacterTextLabel.Text = "Reset Character"
		game:GetService("CoreGui").RobloxGui.SettingsShield.SettingsShield.MenuContainer.BottomButtonFrame.ResetCharacterButtonButton.ResetCharacterButtonTextLabel.Text = "Reset Character"
		ToSpoof[3] = game:GetService("Players").LocalPlayer.Character
		return
	else
		return
	end
end

--// fix this code: (fixed)
if CustomResetCharacter == true then
	game:GetService("CoreGui").RobloxGui.SettingsShield.SettingsShield.MenuContainer.PageViewClipper.PageView.PageViewInnerFrame.ChildAdded:Connect(function(ResetCharacter)
		if ResetCharacter.Name == "ResetCharacter" then
			wait(0.1) -- just in case
			ResetCharacter.ResetCharacterText.ResetButtonContainer.ResetCharacterButton.ResetCharacterTextLabel.Text = "Reset Clone"
			ResetCharacter.ResetCharacterText.ResetButtonContainer.ResetCharacterButton.MouseButton1Down:Connect(Respawn)
		end
	end)

	game:GetService("CoreGui").RobloxGui.SettingsShield.SettingsShield.MenuContainer.BottomButtonFrame.ResetCharacterButtonButton.ResetCharacterButtonTextLabel.Text = "Reset Clone"
	game:GetService("CoreGui").RobloxGui.SettingsShield.SettingsShield.MenuContainer.BottomButtonFrame.ResetCharacterButtonButton.MouseButton1Down:Connect(Respawn)
end

if ResetCharacterInVoid == true then
	local RLeg = StartCharacter:FindFirstChild("Right Leg") or StartCharacter:FindFirstChild("RightFoot")
	local LLeg = StartCharacter:FindFirstChild("Left Leg") or StartCharacter:FindFirstChild("LeftFoot")

	VoidConn = RLeg.Parent.ChildRemoved:Connect(function(R)
		if RespawnCalled then VoidConn:Disconnect() end
		if R == RLeg or R == LLeg then
			Respawn()
		end
	end)
end

local getrawmetatable = getrawmetatable or debug.getmetatable
local newcclosure = newcclosure or function(f) return f end
local setreadonly = setreadonly or make_readonly
if getrawmetatable and checkcaller and setreadonly then
    local game_meta = getrawmetatable(game)
    local game_index = game_meta.__index
    
    setreadonly(game_meta, false)
	game_meta.__index = newcclosure(function(Field, Property)
		if RespawnCalled == true then
			setreadonly(game_meta, false)
			game_meta.__index = game_index -- reset metatable
			setreadonly(game_meta, true)
			return game_index(Field, Property)
		end

        if table.find(ToSpoof, Field) and table.find(ToSpoof, Property) and checkcaller() then
            return ToSpoof[3]
        end
        
        return game_index(Field, Property)
    end)
    setreadonly(game_meta, true)

	coroutine.wrap(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/OpenGamerTips/TextBin/master/CharacterScripts/Animate.lua"))()
	end)()
else
    warn("[REANIMATION] Local character wasn't spoofed. Some vanilla animations will be disabled. You can do workspace[\""..EndCharacter.Name.."\"] instead of game:GetService(\"Players\").LocalPlayer.Character to get the character.")
end

wait(0.5)
UI.Spell("Done!", 0.05)
wait(0.5)
UI.End()
workspace.CurrentCamera.CameraType = SavedType
