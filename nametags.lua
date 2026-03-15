local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local TweenService = game:GetService("TweenService")

local customPlayers = {
	["6vryzx_alt"] = {
		customName = "z33to OWNER",
		icon       = "rbxassetid://139117044448847",
		glitch     = true,
		gradientColorLeft = Color3.fromRGB(160, 32, 240),
		gradientColorRight = Color3.fromRGB(255,255,255),
		nameTextColor = Color3.fromRGB(255, 255, 255),
		usernameTextColor = Color3.fromRGB(255, 255, 255),
		strokeColor = Color3.fromRGB(255, 255, 255),
		strokeThickness = 5,
		cornerRadius = 20,
	},
	["Adamalchoum2"] = {
		customName = "ZT",
		icon       = "rbxassetid://139117044448847",
		glitch     = true,
		gradientColorLeft = Color3.fromRGB(128, 128, 128),
		gradientColorRight = Color3.fromRGB(255,255,255),
		nameTextColor = Color3.fromRGB(255, 255, 255),
		usernameTextColor = Color3.fromRGB(255, 255, 255),
		strokeColor = Color3.fromRGB(255, 255, 255),
		strokeThickness = 5,
		cornerRadius = 20,
	},
	["gamergod0007"] = {
		customName = "ZT",
		icon       = "rbxassetid://139117044448847",
		glitch     = true,
		gradientColorLeft = Color3.fromRGB(128, 128, 128),
		gradientColorRight = Color3.fromRGB(255,255,255),
		nameTextColor = Color3.fromRGB(255, 255, 255),
		usernameTextColor = Color3.fromRGB(255, 255, 255),
		strokeColor = Color3.fromRGB(255, 255, 255),
		strokeThickness = 5,
		cornerRadius = 20,
	},
	["Robloxianw3s1j0e2o"] = {
		customName = "z33to DADDY KIKO",
		icon       = "rbxassetid://139117044448847",
		glitch     = true,
		gradientColorLeft = Color3.fromRGB(255, 0, 0),
		gradientColorRight = Color3.fromRGB(0,0,0),
		nameTextColor = Color3.fromRGB(0,0,0),
		usernameTextColor = Color3.fromRGB(0, 0, 0),
		strokeColor = Color3.fromRGB(0,0,0),
		strokeThickness = 5,
		cornerRadius = 20,
	},
	["6vryzx"] = {
		customName = "z33to KWHY",
		icon       = "rbxassetid://139117044448847",
		glitch     = true,
		gradientColorLeft = Color3.fromRGB(255, 0, 0),
		gradientColorRight = Color3.fromRGB(0,0,0),
		nameTextColor = Color3.fromRGB(0,0,0),
		usernameTextColor = Color3.fromRGB(0, 0, 0),
		strokeColor = Color3.fromRGB(0,0,0),
		strokeThickness = 5,
		cornerRadius = 20,
	},
	["KWHY0_0"] = {
		customName = "z33to KWHY",
		icon       = "rbxassetid://139117044448847",
		glitch     = true,
		gradientColorLeft = Color3.fromRGB(255, 0, 0),
		gradientColorRight = Color3.fromRGB(0,0,0),
		nameTextColor = Color3.fromRGB(0,0,0),
		usernameTextColor = Color3.fromRGB(0, 0, 0),
		strokeColor = Color3.fromRGB(0,0,0),
		strokeThickness = 5,
		cornerRadius = 20,
	},
}

local scriptUsers = {}
local respondedPlayers = {}
local tagSenders = {} -- Track who sent the tag trigger message
local currentPlayer = Players.LocalPlayer
local hasSpoken = false
local generalChannel = nil
local TAG_TRIGGER = "、"
local RESPONSE_TRIGGER = "︑"
local silencedPlayers = {}

local function createGradientColors(color1, color2)
	return ColorSequence.new{
		ColorSequenceKeypoint.new(0, color1),
		ColorSequenceKeypoint.new(1, color2)
	}
end

local function getCustomData(plr)
	if customPlayers[plr.Name] then
		return customPlayers[plr.Name]
	end
	if customPlayers[plr.UserId] then
		return customPlayers[plr.UserId]
	end
	return nil
end

local GLITCH_CHARS = {"™", "®", "¶", "§", "¥", "¢", "ƒ", "„", "†", "‡", "ˆ", "‰", "Š", "‹", "Œ", "Ž", "˜", "˙", "˚", "˝"}

local function applyGlitchEffect(label)
    local originalText = label.Text
    local glitchActive = true
    
    spawn(function()
        while glitchActive and label and label.Parent do
            for i = 1, 3 do
                if not label or not label.Parent then break end
                
                local glitchedText = ""
                for char in originalText:gmatch(".") do
                    if math.random() > 0.7 then
                        glitchedText = glitchedText .. GLITCH_CHARS[math.random(#GLITCH_CHARS)]
                    else
                        glitchedText = glitchedText .. char
                    end
                end
                
                label.Text = glitchedText
                task.wait(0.05)
            end
            
            label.Text = originalText
            task.wait(math.random(3, 6))
        end
    end)
end

local GLITCH_CHARS_PARTICLES = {"™", "®", "¶", "§", "¥", "¢", "ƒ", "„", "†", "‡", "ˆ", "‰", "Š", "‹", "Œ", "Ž", "˜", "˙", "˚", "˝", "▓", "░", "▒", "█", "▀", "▄"}

local function createParticleCanvas(parent, color1, color2)
    local canvas = Instance.new("Frame")
    canvas.Name = "ParticleCanvas"
    canvas.Size = UDim2.new(1, 0, 1, 0)
    canvas.BackgroundTransparency = 1
    canvas.BorderSizePixel = 0
    canvas.Parent = parent
    
    local particles = {}
    local particleCounter = 0
    
    spawn(function()
        while canvas and canvas.Parent do
            pcall(function()
                particleCounter = particleCounter + 1
                if particleCounter % 5 == 0 then
                    local particle = Instance.new("TextLabel")
                    particle.Name = "GlitchParticle_" .. particleCounter
                    particle.Size = UDim2.new(0, 20, 0, 20)
                    particle.BackgroundTransparency = 1
                    particle.BorderSizePixel = 0
                    particle.TextSize = 14
                    particle.Font = Enum.Font.GothamBold
                    particle.TextScaled = true
                    particle.Text = GLITCH_CHARS_PARTICLES[math.random(#GLITCH_CHARS_PARTICLES)]
                    
                    local colorChoice = math.random()
                    local particleColor = colorChoice < 0.5 and color1 or color2
                    particle.TextColor3 = particleColor
                    
                    particle.Parent = canvas
                    
                    local startX = math.random(0, 250)
                    particle.Position = UDim2.new(0, startX, 0, 75)
                    
                    table.insert(particles, {
                        frame = particle,
                        x = startX,
                        y = 75,
                        driftX = (math.random() - 0.5) * 1.5,
                        upSpeed = math.random(1, 2) + math.random() * 0.5,
                        glitchCounter = 0,
                        color1 = color1,
                        color2 = color2
                    })
                end
                
                for i = #particles, 1, -1 do
                    local particle = particles[i]
                    if particle.frame and particle.frame.Parent then
                        particle.y = particle.y - particle.upSpeed
                        particle.x = particle.x + particle.driftX
                        
                        if particle.y < -30 then
                            particle.frame:Destroy()
                            table.remove(particles, i)
                        else
                            if particle.x > 280 then particle.x = -20 end
                            if particle.x < -20 then particle.x = 280 end
                            
                            particle.frame.Position = UDim2.new(0, particle.x, 0, particle.y)
                            
                            particle.glitchCounter = particle.glitchCounter + 1
                            if particle.glitchCounter % 3 == 0 then
                                particle.frame.Text = GLITCH_CHARS_PARTICLES[math.random(#GLITCH_CHARS_PARTICLES)]
                            end
                            
                            local fadeAmount = math.max(0, 1 - (math.abs(particle.y - 35) / 70))
                            particle.frame.TextTransparency = 0.5 + (1 - fadeAmount) * 0.5
                            
                            if particle.glitchCounter % 5 == 0 then
                                local colorChoice = math.random()
                                if colorChoice < 0.5 then
                                    particle.frame.TextColor3 = particle.color1
                                else
                                    particle.frame.TextColor3 = particle.color2
                                end
                            end
                        end
                    else
                        table.remove(particles, i)
                    end
                end
            end)
            task.wait(0.016)
        end
    end)
    
    return canvas
end

local function animateNametag(billboard, dynamicWidth)
    dynamicWidth = dynamicWidth or 1.8
    local fadeInTween = TweenService:Create(
        billboard,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Size = UDim2.new(dynamicWidth, 0, 0.65, 0)}
    )
    
    billboard.Size = UDim2.new(dynamicWidth * 0.8, 0, 0.52, 0)
    fadeInTween:Play()
end

local function pulseBillboard(billboard)
    local dynamicWidth = billboard:GetAttribute("DynamicWidth") or 1.8
    
    local pulseUp = TweenService:Create(
        billboard,
        TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
        {Size = UDim2.new(dynamicWidth * 1.07, 0, 0.7, 0)}
    )
    
    local pulseDown = TweenService:Create(
        billboard,
        TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
        {Size = UDim2.new(dynamicWidth, 0, 0.65, 0)}
    )
    
    pulseUp:Play()
    pulseUp.Completed:Connect(function()
        pulseDown:Play()
    end)
end

local function createNametag(player)
    if not player.Character or not player.Character:FindFirstChild("Head") then
        return
    end
    
    local head = player.Character.Head
    
    if head:FindFirstChild("NametagBillboard") then
        head:FindFirstChild("NametagBillboard"):Destroy()
    end
    
    local customData = getCustomData(player)
    
    local displayName = "USER"
    local gradientColorLeft = Color3.fromRGB(100, 100, 100)
    local gradientColorRight = Color3.fromRGB(150, 150, 150)
    local nameTextColor = Color3.fromRGB(255, 255, 255)
    local usernameTextColor = Color3.fromRGB(255, 255, 255)
    local strokeColor = Color3.fromRGB(255, 255, 255)
    local strokeThickness = 2
    local cornerRadius = 12
    local hasGlitch = false
    
    if customData then
        displayName = customData.customName
        gradientColorLeft = customData.gradientColorLeft or gradientColorLeft
        gradientColorRight = customData.gradientColorRight or gradientColorRight
        nameTextColor = customData.nameTextColor or nameTextColor
        usernameTextColor = customData.usernameTextColor or usernameTextColor
        strokeColor = customData.strokeColor or strokeColor
        strokeThickness = customData.strokeThickness or strokeThickness
        cornerRadius = customData.cornerRadius or cornerRadius
        hasGlitch = customData.glitch or false
    end
    
    local baseWidth = 1.8
    local nameLength = #displayName
    local dynamicWidth = baseWidth + (nameLength * 0.12)
    dynamicWidth = math.max(1.8, math.min(dynamicWidth, 4))
    
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "NametagBillboard"
    billboard.Size = UDim2.new(dynamicWidth, 0, 0.65, 0)
    billboard.MaxDistance = math.huge
    billboard.StudsOffset = Vector3.new(0, 2.5, 0)
    billboard.Parent = head
    
    billboard:SetAttribute("DynamicWidth", dynamicWidth)

    local frame = Instance.new("Frame")
    frame.Name = "NametagFrame"
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundColor3 = gradientColorLeft
    frame.BackgroundTransparency = 0
    frame.BorderSizePixel = 0
    frame.ClipsDescendants = true
    frame.Parent = billboard
    
    local gradient = Instance.new("UIGradient")
    gradient.Color = createGradientColors(gradientColorLeft, gradientColorRight)
    gradient.Rotation = 90
    gradient.Parent = frame
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, cornerRadius)
    corner.Parent = frame
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = strokeColor
    stroke.Thickness = strokeThickness
    stroke.Transparency = 0.3
    stroke.Parent = frame
    
    local particleCanvas = Instance.new("Frame")
    particleCanvas.Name = "ParticleCanvas"
    particleCanvas.Size = UDim2.new(1, 0, 1, 0)
    particleCanvas.BackgroundTransparency = 1
    particleCanvas.BorderSizePixel = 0
    particleCanvas.ZIndex = 1
    particleCanvas.Parent = frame
    
    local particles = {}
    local particleCounter = 0
    
    spawn(function()
        while particleCanvas and particleCanvas.Parent do
            pcall(function()
                particleCounter = particleCounter + 1
                if particleCounter % 3 == 0 then
                    local particle = Instance.new("TextLabel")
                    particle.Name = "Particle_" .. particleCounter
                    particle.Size = UDim2.new(0, 6, 0, 6)
                    particle.BackgroundTransparency = 0.4
                    particle.BackgroundColor3 = nameTextColor
                    particle.BorderSizePixel = 0
                    particle.TextSize = 0
                    particle.Parent = particleCanvas
                    
                    local startX = math.random(10, 90) / 100
                    particle.Position = UDim2.new(startX, -3, -0.1, 0)
                    
                    table.insert(particles, {
                        frame = particle,
                        y = -0.1,
                        speed = math.random(15, 25) / 1000,
                        x = startX
                    })
                end
                
                for i = #particles, 1, -1 do
                    local particle = particles[i]
                    if particle.frame and particle.frame.Parent then
                        particle.y = particle.y + particle.speed
                        
                        if particle.y > 1.1 then
                            particle.frame:Destroy()
                            table.remove(particles, i)
                        else
                            particle.frame.Position = UDim2.new(particle.x, -3, particle.y, 0)
                            
                            local fadeAmount = math.max(0, 1 - math.abs(particle.y - 0.5) * 2)
                            particle.frame.BackgroundTransparency = 0.5 + (1 - fadeAmount) * 0.5
                        end
                    else
                        table.remove(particles, i)
                    end
                end
            end)
            task.wait(0.016)
        end
    end)
    
    local container = Instance.new("Frame")
    container.Name = "Container"
    container.Size = UDim2.new(1, -6, 1, -4)
    container.Position = UDim2.new(0, 3, 0, 2)
    container.BackgroundTransparency = 1
    container.ZIndex = 3
    container.Parent = frame
    
    local layout = Instance.new("UIListLayout")
    layout.FillDirection = Enum.FillDirection.Vertical
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.VerticalAlignment = Enum.VerticalAlignment.Center
    layout.Padding = UDim.new(0, 0)
    layout.Parent = container
    
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Name = "NameLabel"
    nameLabel.Text = displayName
    nameLabel.Size = UDim2.new(1, 0, 0.55, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextColor3 = nameTextColor
    nameLabel.TextSize = 9  
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextScaled = true
    nameLabel.Parent = container
    
    local nameGlow = Instance.new("UIStroke")
    nameGlow.Color = nameTextColor
    nameGlow.Thickness = 1
    nameGlow.Transparency = 0.3
    nameGlow.Parent = nameLabel
    
    if hasGlitch then
        applyGlitchEffect(nameLabel)
    end
    
    local usernameLabel = Instance.new("TextLabel")
    usernameLabel.Name = "UsernameLabel"
    usernameLabel.Text = "@" .. player.Name
    usernameLabel.Size = UDim2.new(1, 0, 0.45, 0)
    usernameLabel.BackgroundTransparency = 1
    usernameLabel.TextColor3 = usernameTextColor
    usernameLabel.TextSize = 6  
    usernameLabel.Font = Enum.Font.Gotham
    usernameLabel.TextScaled = true
    usernameLabel.Parent = container
    
    local usernameGlow = Instance.new("UIStroke")
    usernameGlow.Color = usernameTextColor
    usernameGlow.Thickness = 1
    usernameGlow.Transparency = 0.3
    usernameGlow.Parent = usernameLabel
    
    animateNametag(billboard, dynamicWidth)
    
    return billboard
end

local function sendMessage(message)
    if not generalChannel then
        return
    end
    
    local success = pcall(function()
        generalChannel:SendAsync(message)
    end)
end

local function getGeneralChannel()
    local channels = TextChatService:FindFirstChild("TextChannels")
    if channels then
        local general = channels:FindFirstChild("RBXGeneral")
        if general then return general end
    end
    
    for _, channel in pairs(TextChatService:GetChildren()) do
        if channel:IsA("TextChannel") and channel.Name ~= "RBXSystemChat" then
            return channel
        end
    end
    
    local channel = TextChatService:WaitForChild("General", 5)
    if not channel then
        for _, c in pairs(TextChatService:GetChildren()) do
            if c:IsA("TextChannel") then
                return c
            end
        end
    end
    return channel
end

local function monitorChat()
    if not generalChannel then
        return
    end
    
    generalChannel.MessageReceived:Connect(function(message)
        if message and message.Text then
            local txt = message.Text
            local src = message.TextSource
            
            if not src then return end
            
            local sender = Players:GetPlayerByUserId(src.UserId)
            if not sender then return end
            
            -- Check if this message contains the response trigger (︑)
            local hasResponseTrigger = string.find(txt, "︑") ~= nil
            if hasResponseTrigger then
                print("Response trigger detected from: " .. sender.Name)
                -- Silence the person who originally sent the tag
                if tagSenders[sender.UserId] then
                    local originalSenderId = tagSenders[sender.UserId]
                    silencedPlayers[originalSenderId] = true
                    print("Silenced original tag sender UserId: " .. originalSenderId)
                end
            end
            
            -- Check if this message contains the tag trigger (、)
            local hasTagTrigger = string.find(txt, "、") ~= nil
            if hasTagTrigger then
                if sender and sender ~= currentPlayer then
                    -- Store who sent this tag trigger
                    tagSenders[sender.UserId] = sender.UserId
                    print("Tag trigger detected from: " .. sender.Name .. " (UserId: " .. sender.UserId .. ") | Already Silenced: " .. tostring(silencedPlayers[sender.UserId] or false))
                    
                    -- Only respond if this player hasn't been silenced
                    if not silencedPlayers[sender.UserId] then
                        if not respondedPlayers[sender.UserId] then
                            task.wait(0.5)
                            sendMessage("、")
                            respondedPlayers[sender.UserId] = true
                            hasSpoken = true
                            print("Sent response to: " .. sender.Name)
                        end
                        
                        if not scriptUsers[sender.UserId] then
                            scriptUsers[sender.UserId] = sender
                            
                            if sender.Character then
                                local billboard = createNametag(sender)
                                if billboard then
                                    pulseBillboard(billboard)
                                end
                            else
                                sender.CharacterAdded:Wait()
                                task.wait(0.5)
                                local billboard = createNametag(sender)
                                if billboard then
                                    pulseBillboard(billboard)
                                end
                            end
                        end
                    else
                        print(sender.Name .. " is silenced, not responding")
                    end
                end
            end
        end
    end)
end

task.wait(1)

if not currentPlayer then
    currentPlayer = Players:WaitForChild("LocalPlayer", 5)
end

if not currentPlayer then
    return
end

generalChannel = getGeneralChannel()

if not generalChannel then
    for i = 1, 10 do
        task.wait(0.5)
        generalChannel = getGeneralChannel()
        if generalChannel then
            break
        end
    end
end

scriptUsers[currentPlayer.UserId] = currentPlayer

if currentPlayer.Character then
    local billboard = createNametag(currentPlayer)
    if billboard then
        pulseBillboard(billboard)
    end
end

if generalChannel then
    monitorChat()
end

task.wait(1)
if generalChannel and not hasSpoken then
    sendMessage(TAG_TRIGGER)
    hasSpoken = true
end

currentPlayer.CharacterAdded:Connect(function()
    task.wait(0.8)
    if currentPlayer.Character and currentPlayer.Character:FindFirstChild("Head") then
        local billboard = createNametag(currentPlayer)
    end
end)

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        task.wait(0.5)
        if scriptUsers[player.UserId] and player.Character and player.Character:FindFirstChild("Head") then
            local billboard = createNametag(player)
        end
    end)
end)

for _, player in pairs(Players:GetPlayers()) do
    if player ~= currentPlayer then
        player.CharacterAdded:Connect(function()
            task.wait(0.5)
            if scriptUsers[player.UserId] and player.Character and player.Character:FindFirstChild("Head") then
                local billboard = createNametag(player)
            end
        end)
    end
end

Players.PlayerRemoving:Connect(function(plr)
    scriptUsers[plr.UserId] = nil
    respondedPlayers[plr.UserId] = nil
    silencedPlayers[plr.UserId] = nil
    tagSenders[plr.UserId] = nil
end)
