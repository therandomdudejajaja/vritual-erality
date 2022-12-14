-- Toggle : [=]        (enable / disable drawing)
-- Undo : [Z]          (remove last drawn line in canvas)
-- Draw : [Left Click] (draw)
-- Clear : [F]         (clear canvas)
-- Rainbow : [R]       (toggle rainbow color drawings)
-- Neon Glow : [X]     (toggle glowing drawings)
-- Other in GUI
-- Toxicity : [Q]      (toggle toxicity aka kills people)

local plr = game:GetService("Players").LocalPlayer
char = plr.Character
mouse = plr:GetMouse()

function tween(object,style,direction,t,goal)
    local tweenservice = game:GetService("TweenService")
    local tweenInfo = TweenInfo.new(t,Enum.EasingStyle[style],Enum.EasingDirection[direction])
    local tween = tweenservice:Create(object,tweenInfo,goal)
    tween:Play()
    return tween
end

enabled = true

local pgui = game.Players.LocalPlayer:WaitForChild("PlayerGui")

GUI = Instance.new("ScreenGui")
GUI.ResetOnSpawn = false
Frame1 = Instance.new("Frame")
TextLabel2 = Instance.new("TextLabel")
Frame3 = Instance.new("Frame")
Frame4 = Instance.new("Frame")
Frame5 = Instance.new("Frame")
Frame6 = Instance.new("Frame")
TextLabel7 = Instance.new("TextLabel")
TextLabel8 = Instance.new("TextLabel")
TextLabel9 = Instance.new("TextLabel")
TextLabel10 = Instance.new("TextLabel")
Frame11 = Instance.new("Frame")
Frame12 = Instance.new("Frame")
Frame13 = Instance.new("Frame")
Frame14 = Instance.new("Frame")
Frame15 = Instance.new("Frame")
Frame16 = Instance.new("Frame")
ImageButton17 = Instance.new("ImageButton")
TextLabel18 = Instance.new("TextLabel")
ImageButton19 = Instance.new("ImageButton")
LocalScript20 = Instance.new("LocalScript")
Color3Value21 = Instance.new("Color3Value")
TextLabel22 = Instance.new("TextLabel")
TextLabel23 = Instance.new("TextLabel")
TextLabel24 = Instance.new("TextLabel")
TextLabel25 = Instance.new("TextLabel")
GUI.Parent = pgui
Frame1.Name = "Settings"
Frame1.Parent = GUI
Frame1.Transparency = 0.80000001192093
Frame1.Size = UDim2.new(0, 191, 0, 130)
Frame1.Position = UDim2.new(0, 266, 0, 130)
Frame1.Active = true
Frame1.BackgroundColor3 = Color3.new(0.0470588, 0.0509804, 0.0588235)
Frame1.BackgroundTransparency = 0.80000001192093
Frame1.BorderColor3 = Color3.new(1, 1, 1)
Frame1.BorderSizePixel = 0
Frame1.Draggable = true
TextLabel2.Parent = Frame1
TextLabel2.Size = UDim2.new(0, 191, 0, 15)
TextLabel2.Text = "Neodymn's Draw Tool"
TextLabel2.Position = UDim2.new(0, 0, 0, 5)
TextLabel2.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel2.BackgroundTransparency = 1
TextLabel2.Font = Enum.Font.SourceSansBold
TextLabel2.TextSize = 22
TextLabel2.TextColor3 = Color3.new(1, 1, 1)
TextLabel2.TextStrokeColor3 = Color3.new(1, 1, 1)
TextLabel2.TextWrapped = false
Frame3.Parent = Frame1
Frame3.Size = UDim2.new(0, 3, 1, 0)
Frame3.Position = UDim2.new(0, -3, 0, 0)
Frame3.BackgroundColor3 = Color3.new(1, 1, 1)
Frame3.BorderSizePixel = 0
Frame4.Parent = Frame1
Frame4.Size = UDim2.new(0, 3, 1, 0)
Frame4.Position = UDim2.new(1, 0, 0, 0)
Frame4.BackgroundColor3 = Color3.new(1, 1, 1)
Frame4.BorderSizePixel = 0
Frame5.Parent = Frame1
Frame5.Size = UDim2.new(1, 0, 0, 3)
Frame5.Position = UDim2.new(0, 0, 0, -3)
Frame5.BackgroundColor3 = Color3.new(1, 1, 1)
Frame5.BorderSizePixel = 0
Frame6.Parent = Frame1
Frame6.Size = UDim2.new(1, 0, 0, 3)
Frame6.Position = UDim2.new(0, 0, 1, 0)
Frame6.BackgroundColor3 = Color3.new(1, 1, 1)
Frame6.BorderSizePixel = 0
TextLabel7.Parent = Frame1
TextLabel7.Size = UDim2.new(0, 95, 0, 25)
TextLabel7.Text = "Thickness (m/n)"
TextLabel7.Position = UDim2.new(0, 5, 0, 25)
TextLabel7.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel7.BackgroundTransparency = 1
TextLabel7.Font = Enum.Font.SourceSansBold
TextLabel7.TextSize = 20
TextLabel7.TextColor3 = Color3.new(1, 1, 1)
TextLabel7.TextStrokeColor3 = Color3.new(1, 1, 1)
TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
TextLabel8.Parent = Frame1
TextLabel8.Size = UDim2.new(0, 95, 0, 25)
TextLabel8.Text = "Can Collide (c)"
TextLabel8.Position = UDim2.new(0, 5, 0, 50)
TextLabel8.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel8.BackgroundTransparency = 1
TextLabel8.Font = Enum.Font.SourceSansBold
TextLabel8.TextSize = 20
TextLabel8.TextColor3 = Color3.new(1, 1, 1)
TextLabel8.TextStrokeColor3 = Color3.new(1, 1, 1)
TextLabel8.TextXAlignment = Enum.TextXAlignment.Left
TextLabel9.Parent = Frame1
TextLabel9.Size = UDim2.new(0, 95, 0, 25)
TextLabel9.Text = "Opacity (b/v)"
TextLabel9.Position = UDim2.new(0, 5, 0, 75)
TextLabel9.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel9.BackgroundTransparency = 1
TextLabel9.Font = Enum.Font.SourceSansBold
TextLabel9.TextSize = 20
TextLabel9.TextColor3 = Color3.new(1, 1, 1)
TextLabel9.TextStrokeColor3 = Color3.new(1, 1, 1)
TextLabel9.TextXAlignment = Enum.TextXAlignment.Left
TextLabel10.Parent = Frame1
TextLabel10.Size = UDim2.new(0, 95, 0, 25)
TextLabel10.Text = "Color (r)"
TextLabel10.Position = UDim2.new(0, 5, 0, 100)
TextLabel10.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel10.BackgroundTransparency = 1
TextLabel10.Font = Enum.Font.SourceSansBold
TextLabel10.TextSize = 20
TextLabel10.TextColor3 = Color3.new(1, 1, 1)
TextLabel10.TextStrokeColor3 = Color3.new(1, 1, 1)
TextLabel10.TextXAlignment = Enum.TextXAlignment.Left
Frame11.Name = "Color"
Frame11.Parent = Frame1
Frame11.Transparency = 0.80000001192093
Frame11.Size = UDim2.new(0, 121, 0, 115)
Frame11.Position = UDim2.new(0, 201, 0, 15)
Frame11.BackgroundColor3 = Color3.new(0.0470588, 0.0509804, 0.0588235)
Frame11.BackgroundTransparency = 0.80000001192093
Frame11.BorderColor3 = Color3.new(1, 1, 1)
Frame11.BorderSizePixel = 0
Frame11.Draggable = true
Frame12.Parent = Frame11
Frame12.Size = UDim2.new(0, 3, 1, 0)
Frame12.Position = UDim2.new(1, 0, 0, 0)
Frame12.BackgroundColor3 = Color3.new(1, 1, 1)
Frame12.BorderSizePixel = 0
Frame13.Parent = Frame11
Frame13.Size = UDim2.new(1, 0, 0, 3)
Frame13.Position = UDim2.new(0, 0, 0, -3)
Frame13.BackgroundColor3 = Color3.new(1, 1, 1)
Frame13.BorderSizePixel = 0
Frame14.Parent = Frame11
Frame14.Size = UDim2.new(1, 0, 0, 3)
Frame14.Position = UDim2.new(0, 0, 1, 0)
Frame14.BackgroundColor3 = Color3.new(1, 1, 1)
Frame14.BorderSizePixel = 0
Frame15.Parent = Frame11
Frame15.Size = UDim2.new(0, 3, 1, 0)
Frame15.Position = UDim2.new(0, -3, 0, 0)
Frame15.BackgroundColor3 = Color3.new(1, 1, 1)
Frame15.BorderSizePixel = 0
Frame16.Name = "Picker"
Frame16.Parent = Frame11
Frame16.Transparency = 1
Frame16.Size = UDim2.new(0, 286, 0, 255)
Frame16.Position = UDim2.new(0, -372, 0, -55)
Frame16.BackgroundColor3 = Color3.new(0.498039, 0.247059, 0.247059)
Frame16.BackgroundTransparency = 1
Frame16.BorderColor3 = Color3.new(0, 0, 0)
ImageButton17.Name = "SV"
ImageButton17.Parent = Frame16
ImageButton17.Size = UDim2.new(0, 101, 0, 105)
ImageButton17.Position = UDim2.new(0, 377, 0, 60)
ImageButton17.BackgroundColor3 = Color3.new(1, 0, 0)
ImageButton17.BorderColor3 = Color3.new(0, 0, 0)
ImageButton17.BorderSizePixel = 0
ImageButton17.AutoButtonColor = false
ImageButton17.Image = "http://www.roblox.com/asset/?id=42462986"
TextLabel18.Name = "Locator"
TextLabel18.Parent = ImageButton17
TextLabel18.Text = "o"
TextLabel18.Position = UDim2.new(0.5, 0, 0.5, 0)
TextLabel18.BorderColor3 = Color3.new(0, 0, 0)
TextLabel18.FontSize = Enum.FontSize.Size12
TextLabel18.TextColor3 = Color3.new(1, 1, 1)
ImageButton19.Name = "H"
ImageButton19.Parent = Frame16
ImageButton19.Size = UDim2.new(0, 10, 0, 105)
ImageButton19.Position = UDim2.new(0, 477, 0, 60)
ImageButton19.BorderColor3 = Color3.new(0, 0, 0)
ImageButton19.BorderSizePixel = 0
ImageButton19.AutoButtonColor = false
ImageButton19.Image = "http://www.roblox.com/asset/?id=42463044"
LocalScript20.Parent = Frame16
Color3Value21.Name = "Col"
Color3Value21.Parent = Frame11
TextLabel22.Name = "ColorT"
TextLabel22.Parent = Frame1
TextLabel22.Size = UDim2.new(0, 65, 0, 25)
TextLabel22.Text = "0, 0, 0"
TextLabel22.Position = UDim2.new(0, 126, 0, 100)
TextLabel22.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel22.BackgroundTransparency = 1
TextLabel22.Font = Enum.Font.SourceSansBold
TextLabel22.TextSize = 20
TextLabel22.TextColor3 = Color3.new(1, 1, 1)
TextLabel22.TextScaled = true
TextLabel22.TextStrokeColor3 = Color3.new(1, 1, 1)
TextLabel22.TextWrapped = true
TextLabel23.Name = "Transparent"
TextLabel23.Parent = Frame1
TextLabel23.Size = UDim2.new(0, 25, 0, 25)
TextLabel23.Text = "0"
TextLabel23.Position = UDim2.new(0, 146, 0, 75)
TextLabel23.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel23.BackgroundTransparency = 1
TextLabel23.Font = Enum.Font.SourceSansBold
TextLabel23.TextSize = 20
TextLabel23.TextColor3 = Color3.new(1, 1, 1)
TextLabel23.TextStrokeColor3 = Color3.new(1, 1, 1)
TextLabel23.TextWrapped = true
TextLabel24.Name = "CanCollide"
TextLabel24.Parent = Frame1
TextLabel24.Size = UDim2.new(0, 55, 0, 25)
TextLabel24.Text = "false"
TextLabel24.Position = UDim2.new(0, 131, 0, 50)
TextLabel24.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel24.BackgroundTransparency = 1
TextLabel24.Font = Enum.Font.SourceSansBold
TextLabel24.TextSize = 20
TextLabel24.TextColor3 = Color3.new(1, 1, 1)
TextLabel24.TextStrokeColor3 = Color3.new(1, 1, 1)
TextLabel24.TextWrapped = true
TextLabel25.Name = "Thickness"
TextLabel25.Parent = Frame1
TextLabel25.Size = UDim2.new(0, 25, 0, 25)
TextLabel25.Text = "1"
TextLabel25.Position = UDim2.new(0, 146, 0, 25)
TextLabel25.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel25.BackgroundTransparency = 1
TextLabel25.Font = Enum.Font.SourceSansBold
TextLabel25.TextSize = 20
TextLabel25.TextColor3 = Color3.new(1, 1, 1)
TextLabel25.TextStrokeColor3 = Color3.new(1, 1, 1)
TextLabel25.TextWrapped = true

presets = GUI.Settings
colors = presets.Color

function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return tostring(math.floor(num * mult + 0.5) / mult)
end

spawn(function()
	local frame = colors.Picker
	local sv = frame.SV
	local h = frame.H
	local locator = sv.Locator
	
	local hue = 0
	local saturation = 0.5
	local value = 0.5
	
	local changingHue = false
	local changingSv = false
	
	function getRGBfromHue()
		local r,g,b = 0,0,0
		if hue>=120 and hue<=240 then r = 0
		elseif hue>=300 or hue<=60 then r = 1
		elseif hue>60 and hue<120 then r = 1-(hue-60)/60
		elseif hue>240 and hue<300 then r = (hue-240)/60
		end
	
		if hue>=240 and hue<=360 then g = 0
		elseif hue>=60 and hue<=180 then g = 1
		elseif hue>180 and hue<240 then g = 1-(hue-180)/60
		elseif hue<60 then g = hue/60
		end
	
		if hue<=120 then b = 0
		elseif hue>=180 and hue<=300 then b = 1
		elseif hue>120 and hue<180 then b = (hue-120)/60
		elseif hue>300 and hue<360 then b = 1-(hue-300)/60
		end
		return r,g,b
	end
	
	function changeHue(x,y)
		if not changingHue then return end
		hue = 360*(1-(y-h.AbsolutePosition.y)/h.AbsoluteSize.y)+85
	
		local r,g,b = getRGBfromHue()
	
		sv.BackgroundColor3 = Color3.new(r,g,b)
		toRGB()
	end
	
	function changeSv(x,y)
		if not changingSv then return end
		local x,y = x-sv.AbsolutePosition.x,y-sv.AbsolutePosition.y-35
		locator.Position = UDim2.new(0,x,0,y)
		if y>=(sv.AbsoluteSize.y)/2 then locator.TextColor3 = Color3.new(1,1,1) else locator.TextColor3 = Color3.new(0,0,0) end
		saturation,value = 1-(x/sv.AbsoluteSize.x), 1-(y/sv.AbsoluteSize.y)
		toRGB()
	end
	
	function toRGB()
		local r,g,b = getRGBfromHue()
	
		local max = math.max(r,g,b)
		r,g,b = value*(r+saturation*(max-r)),value*(g+saturation*(max-g)),value*(b+saturation*(max-b))
	
	
		colors.Col.Value = Color3.new(r,g,b)
	end
	
	h.MouseButton1Down:connect(function(x,y) changingHue = true changeHue(x,y) end)
	h.MouseButton1Up:connect(function() changingHue = false end)
	h.MouseMoved:connect(changeHue)
	
	sv.MouseButton1Down:connect(function(x,y) changingSv = true changeSv(x,y) end)
	sv.MouseButton1Up:connect(function() changingSv = false end)
	sv.MouseMoved:connect(changeSv)
end)

spawn(function()
	while wait() do
		if transparency < 0 then transparency = 0 end
		if transparency > 1 then transparency = 0 end
		color = colors.Col.Value
		local c = color
		if c.r < 0 then
			c = Color3.new(0,c.g,c.b)
		end
		if c.g < 0 then
			c = Color3.new(c.r,0,c.b)
		end
		if c.b < 0 then
			c = Color3.new(c.r,c.g,0)
		end
		if c.r > 1 then
			c = Color3.new(1,c.g,c.b)
		end
		if c.g > 1 then
			c = Color3.new(c.r,1,c.b)
		end
		if c.b > 1 then
			c = Color3.new(c.r,c.g,1)
		end
		color = c
		colors.Col.Value = c
		presets.ColorT.Text = round(color.r,1)..", "..round(color.g,1)..", "..round(color.b,1)
		presets.Transparent.Text = tostring(transparency)
		local th = tostring(thickness)
		if thickness < 0.15 then
			th = '0.1'
		end
		presets.Thickness.Text = tostring(th)
		presets.CanCollide.Text = tostring(canCollide)
	end
end)

local UIS = game:GetService("UserInputService")
UIS.InputEnded:connect(function(k,g)
	if k.KeyCode == Enum.KeyCode.Equals and not g then
		enabled = not enabled
	end
end)

drawings = Instance.new("Model",workspace)
drawings.Name = "Drawings"

lastd = nil

spawn(function()
	while wait() do
		mouse = plr:GetMouse()
		if drawings == nil then
			drawings = Instance.new("Model",workspace)
			drawings.Name = "Drawings"
		end
		if drawings.Parent ~= workspace then
			drawings.Parent = workspace
		end
	end
end)

canCollide = false
canStack = false
thickness = 1
color = Color3.new(1,0,0)
transparency = 0
interval = 0.1
rainbow = false


lastm = nil

drawing = false

neon = false


local zDown = false

mdown = false
ndown = false
bdown = false
vdown = false

spawn(function()
	while wait() do
		if ndown == true then
			if not (thickness < 0.2) then
				thickness = thickness - 0.2
			end
		end
		if mdown == true then
			if (thickness < 20) then
				thickness = thickness + 0.2
			end
		end
		if bdown == true then
			if (transparency < 0.9) then
				transparency = transparency + 0.1
				wait(0.1)
			end
		end
		if vdown == true then
			if (transparency > 0) then
				transparency = transparency - 0.1
			end
			if string.sub(tostring(transparency),1,3) == "2.7" then transparency = 0 end
			wait(0.1)
		end
	end
end)
killer = false
mouse.KeyDown:connect(function(k)
	if enabled == false then return end
	local key = k:lower()
	if key == "m" then
		mdown = true
	end
	if key == "q" then
		killer = not killer
	end
	if key == "n" then
		ndown = true
	end
	if key == "x" then
		neon = not neon
	end
	if key == "b" then
		bdown = true
	end
	if key == "v" then
		vdown = true
	end
	if key == "z" then
		zDown = true
		local draw = drawings[#drawings:GetChildren()]
		if not draw then return end
		draw:Destroy()
	end
	if key == "f" then
		drawings:ClearAllChildren()
	end
	if key == "r" then
		rainbow = not rainbow
	end
	if key == "c" then
		canCollide = not canCollide
	end
end)

mouse.KeyUp:connect(function(k)
	local key = k:lower()
	if key == "m" then
		mdown = false
	end
	if key == "n" then
		ndown = false
	end
	if key == "b" then
		bdown = false
	end
	if key == "v" then
		vdown = false
	end
	if key == "z" then
		zDown = false
	end
end)

local uis = game:GetService("UserInputService")
uis.InputBegan:connect(function(k,g)
	if g then return end
	if k.UserInputType == Enum.UserInputType.MouseButton1 then
		drawing = true
	end
end)
uis.InputEnded:connect(function(k,g)
	if k.UserInputType == Enum.UserInputType.MouseButton1 then
		drawing = false
	end
end)

spawn(function()
	while wait() do
		if zDown == true then
			local zWasUp = false
			local n = 0
			repeat wait() if zDown == false then zWasUp = true end n = n + 0.5 until n >= 10
			if zDown == true and zWasUp == false then
				repeat 
					game:GetService("RunService").RenderStepped:Wait()
					pcall(function() 
						local draw = drawings[#drawings:GetChildren()]
						draw:Destroy()
					end)
				until zDown == false
			end
		end
	end
end)

mouse.TargetFilter = drawings
ldraw = nil
game:GetService("RunService").RenderStepped:connect(function()
	if drawing == false then
		lastm = mouse.Hit.p
		ldraw = nil
	end
	print(drawing)
	if drawing == true and (lastm ~= mouse.Hit.p) and enabled then
		local mp = mouse.Hit.p
		local mh = mouse.Hit
		local mt = mouse.Target
		if not ldraw then lastm = mp end
		if true then
			if (mp - lastm).magnitude < thickness*1.5 and ldraw then return end
			local draw = Instance.new("Part",drawings)
			draw.Name = #drawings:GetChildren()
			draw.Anchored = true
			draw.CanCollide = canCollide
			if neon then
				draw.Material = "Neon"
			else
				draw.Material = "SmoothPlastic"
			end
			draw.Transparency = transparency
			draw.CFrame = CFrame.new((lastm + mouse.Hit.p)/2,lastm) 
			
			draw.Size = Vector3.new(0,0,(lastm - mp).magnitude)
			tween(draw, "Sine", "Out", 0.1, {
				Size = Vector3.new(thickness,thickness,(lastm - mp).magnitude)
			})
			local orr = draw.Size
			
			if killer then
				coroutine.resume(coroutine.create(function()
					local oz = Vector3.new(thickness,thickness,(lastm - mp).magnitude)
					while draw and draw.Parent == drawings do
						local t = tween(draw, "Sine", "InOut", 0.5, {
							Size = oz * 1.2 + Vector3.new(0.25,0.25,0)
						})
						t.Completed:Wait(0)
						local t = tween(draw, "Sine", "InOut", 0.5, {
							Size = oz
						})
						t.Completed:Wait(0)
					end
				end))
			end
			
			if rainbow == false then
				draw.Color = color
			else
				local start = 0
				spawn(function()
					local rs = 1
					while game:GetService("RunService").RenderStepped:Wait() do
						game:GetService("RunService").RenderStepped:Wait()
						game:GetService("RunService").RenderStepped:Wait()
						if draw == nil or draw.Parent == nil then break end
						rs = rs + 0.2
						local r = (math.sin(start/2)/2)+0.5
						local g = (math.sin(start)/2)+0.5
						local b = (math.sin(start*1.5)/2)+0.5
						local color3 = Color3.new(r, g, b)
						draw.Color = color3
						start = start + interval + math.abs(math.sin(rs))/10
					end
				end)
			end
			ldraw = draw
		end
	end
	lastm = mouse.Hit.p
end)
x1.00
