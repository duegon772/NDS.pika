local virtualUser = game:GetService('VirtualUser')
virtualUser:CaptureController()
local lp = game.Players.LocalPlayer
local lixeiras = {}
local key = game:GetService("UserInputService")
local autofarm = false
local n = 0
key.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.P then
        if autofarm then
            autofarm = false
            view(lp.Character:FindFirstChildOfClass('Humanoid'))
            notify(autofarm)
            else
            autofarm = true
            notify(autofarm)
        end
	end
end)

function view(obj)
workspace.CurrentCamera.CameraSubject = obj
end


function rando(condition)
    local rando
    local sexoon = {'sexo on', 'sexo apenas', 'sexo ligado','sexo working', 'sexo sim'}
    local sexooff = {'sexo off', 'sexo nunca', 'sexo desligado','sexo not working', 'sexo nao'}
    if condition then
        rando1 = sexoon[math.random(#sexoon)]
    else
        rando1 = sexooff[math.random(#sexooff)]
    end
    return tostring(rando1)
end

function notify(condition)
    game:GetService("StarterGui"):SetCore("SendNotification",{
    	Title = "balneario sexo", 
    	Text = rando(condition),
    	Icon = 'rbxassetid://10899663828', 
    	Duration = 3
    })
end

function getfood()
    if lp.Info.Fome.Value <= 10 then
        if lp.Backpack:FindFirstChild('Hamburger')  then
            lp.Backpack.Hamburger.Parent = lp.Character
            lp.Character:FindFirstChild('Hamburger'):Activate()
        elseif lp.Character:FindFirstChild('Hamburger') then
            lp.Character:FindFirstChild('Hamburger'):Activate()
        else
            local args = {[1] = "Comprar",[2] = "Hamburger"}
            game:GetService("ReplicatedStorage").Remotes.Fastfood:FireServer(unpack(args))
            waitt = lp.Backpack:WaitForChild('Hamburger')
            wait()
            waitt.Parent = lp.Character
            lp.Character:FindFirstChild('Hamburger'):Activate()
        end
    end
    if lp.Info.Sede.Value <= 10 then
        if lp.Backpack:FindFirstChild('MilkShake')  then
            lp.Backpack.MilkShake.Parent = lp.Character
            wait()
            game:GetService("Players").LocalPlayer.Character.MilkShake.Event:FireServer()
        elseif lp.Character:FindFirstChild('MilkShake') then
            game:GetService("Players").LocalPlayer.Character.MilkShake.Event:FireServer()
        else
            local args = {[1] = "Comprar",[2] = "MilkShake"}
            game:GetService("ReplicatedStorage").Remotes.Fastfood:FireServer(unpack(args))
            waitt = lp.Backpack:WaitForChild('MilkShake')
            wait()
            waitt.Parent = lp.Character
            wait(0.2)
            game:GetService("Players").LocalPlayer.Character.MilkShake.Event:FireServer()
        end
    end
end


--lixeira
for _,v in pairs(game:GetService("Workspace")["! World"]:GetChildren()) do
    if v:IsA('MeshPart') and v:FindFirstChildOfClass('ProximityPrompt') and v.MeshId == 'rbxassetid://7004704451' then
        table.insert(lixeiras, v)
    end
end




while wait() do
    if autofarm then
        for _,v in pairs(game:GetService("Workspace")["! World"]:GetChildren()) do
            if v:IsA('Model') and v:FindFirstChildOfClass('MeshPart') then 
                if v:FindFirstChildOfClass('MeshPart').MeshId == 'rbxassetid://5496422297' and v:FindFirstChildOfClass('MeshPart').Transparency ~= 1 and autofarm then
                    lp.Character.HumanoidRootPart.CFrame = CFrame.new(v:FindFirstChildOfClass('MeshPart').Position)
                    view(v:FindFirstChildOfClass('MeshPart'))
                    repeat
                        lp.Character.HumanoidRootPart.CFrame = CFrame.new(v:FindFirstChildOfClass('MeshPart').Position)
                        wait(1)
                        virtualUser:SetKeyDown('0x65') 
                        wait(1)
                        virtualUser:SetKeyUp('0x65')
                        if n > 4 then
                            n = 0
                        break
                        else
                        n=n+1
                        end
                        wait(0.2)
                    until lp.Character:FindFirstChild('Lixo_model') or not autofarm 
                    if autofarm then
                        n=0
                        lp.Character.HumanoidRootPart.CFrame = CFrame.new(lixeiras[1].Position)
                        view(lixeiras[1])
                        else
                        view(lp.Character:FindFirstChildOfClass('Humanoid'))
                    end        
                    repeat
                        lp.Character.HumanoidRootPart.CFrame = CFrame.new(lixeiras[1].Position)
                        fireproximityprompt(lixeiras[1]:FindFirstChildOfClass('ProximityPrompt'))
                        wait(1)
                        if not autofarm then
                            view(lp.Character:FindFirstChildOfClass('Humanoid'))
                            break
                        end
                    until not lp.Character:FindFirstChild('Lixo_model') or (not autofarm)
                end
            end
        end
        getfood()
    end
end
--




