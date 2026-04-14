-- GUI simples
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 200, 0, 150)
Frame.Position = UDim2.new(0.05, 0, 0.3, 0)
Frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
Frame.Parent = ScreenGui

local UIStroke = Instance.new("UIStroke", Frame)
UIStroke.Color = Color3.fromRGB(255, 0, 0)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,0,0,30)
Title.Text = "Troll Panel 😈"
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.new(1,1,1)
Title.Parent = Frame

-- BOTÃO VOID TRAP
local VoidButton = Instance.new("TextButton")
VoidButton.Size = UDim2.new(1, -10, 0, 40)
VoidButton.Position = UDim2.new(0,5,0,40)
VoidButton.Text = "Void Trap"
VoidButton.BackgroundColor3 = Color3.fromRGB(40,40,40)
VoidButton.TextColor3 = Color3.new(1,1,1)
VoidButton.Parent = Frame

-- BOTÃO PRISÃO
local CageButton = Instance.new("TextButton")
CageButton.Size = UDim2.new(1, -10, 0, 40)
CageButton.Position = UDim2.new(0,5,0,90)
CageButton.Text = "Prisão Invisível"
CageButton.BackgroundColor3 = Color3.fromRGB(40,40,40)
CageButton.TextColor3 = Color3.new(1,1,1)
CageButton.Parent = Frame

local lp = game.Players.LocalPlayer

-- FUNÇÃO VOID TRAP
VoidButton.MouseButton1Click:Connect(function()
    for i,v in pairs(game.Players:GetPlayers()) do
        if v ~= lp and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            
            local hrp = v.Character.HumanoidRootPart
            
            -- joga pro void
            hrp.CFrame = CFrame.new(0, -50, 0)
            
        end
    end
end)

-- FUNÇÃO PRISÃO INVISÍVEL
CageButton.MouseButton1Click:Connect(function()
    for i,v in pairs(game.Players:GetPlayers()) do
        if v ~= lp and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            
            local char = v.Character
            local root = char.HumanoidRootPart
            
            -- cria paredes invisíveis
            for _,offset in pairs({
                Vector3.new(5,0,0),
                Vector3.new(-5,0,0),
                Vector3.new(0,0,5),
                Vector3.new(0,0,-5)
            }) do
                
                local wall = Instance.new("Part")
                wall.Size = Vector3.new(1,10,10)
                wall.Anchored = true
                wall.CanCollide = true
                wall.Transparency = 1
                wall.Position = root.Position + offset
                wall.Parent = workspace
                
                game.Debris:AddItem(wall, 10) -- some depois
            end
            
        end
    end
end)
