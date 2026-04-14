-- GUI simples
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 200, 0, 180)
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

-- CAIXA DE TEXTO (nome do player)
local PlayerBox = Instance.new("TextBox")
PlayerBox.Size = UDim2.new(1, -10, 0, 30)
PlayerBox.Position = UDim2.new(0,5,0,30)
PlayerBox.PlaceholderText = "Nome do player"
PlayerBox.Text = ""
PlayerBox.BackgroundColor3 = Color3.fromRGB(30,30,30)
PlayerBox.TextColor3 = Color3.new(1,1,1)
PlayerBox.Parent = Frame

-- BOTÃO VOID TRAP
local VoidButton = Instance.new("TextButton")
VoidButton.Size = UDim2.new(1, -10, 0, 40)
VoidButton.Position = UDim2.new(0,5,0,70)
VoidButton.Text = "Void Trap"
VoidButton.BackgroundColor3 = Color3.fromRGB(40,40,40)
VoidButton.TextColor3 = Color3.new(1,1,1)
VoidButton.Parent = Frame

-- BOTÃO PRISÃO
local CageButton = Instance.new("TextButton")
CageButton.Size = UDim2.new(1, -10, 0, 40)
CageButton.Position = UDim2.new(0,5,0,120)
CageButton.Text = "Prisão Invisível"
CageButton.BackgroundColor3 = Color3.fromRGB(40,40,40)
CageButton.TextColor3 = Color3.new(1,1,1)
CageButton.Parent = Frame

local lp = game.Players.LocalPlayer

-- VOID TRAP
VoidButton.MouseButton1Click:Connect(function()
    local targetName = PlayerBox.Text
    
    for _,v in pairs(game.Players:GetPlayers()) do
        if string.find(string.lower(v.Name), string.lower(targetName)) then
            
            if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                v.Character.HumanoidRootPart.CFrame = CFrame.new(0, -50, 0)
            end
            
        end
    end
end)

-- PRISÃO INVISÍVEL
CageButton.MouseButton1Click:Connect(function()
    local targetName = PlayerBox.Text
    
    for _,v in pairs(game.Players:GetPlayers()) do
        if string.find(string.lower(v.Name), string.lower(targetName)) then
            
            if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                
                local root = v.Character.HumanoidRootPart
                
                for _,offset in pairs({
                    Vector3.new(5,0,0),
                    Vector3.new(-5,0,0),
                    Vector3.new(0,0,5),
                    Vector3.new(0,0,-5),
                    Vector3.new(0,5,0),
                }) do
                    
                    local wall = Instance.new("Part")
                    wall.Size = Vector3.new(10,10,1)
                    wall.Anchored = true
                    wall.CanCollide = true
                    wall.Transparency = 1
                    wall.Position = root.Position + offset
                    wall.Parent = workspace
                    
                    game.Debris:AddItem(wall, 10)
                end
                
            end
            
        end
    end
end)
