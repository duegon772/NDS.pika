--[[
//configuracoes da gui (save config e etc)

//corrigir o void player

//toggle fly (e slide da velocidade do speed do flykkk)

//tab dos creditos e da donate

//ativar comandos por chat, e ate mesmo dar item a quem digitar por exemplo !ballon no chat

//loop eat RedApple

//tool fling (invisible fling tbm talvez)

//sit toggle
]]--




local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

--cria uma nova janela onde fica as abas
local Window = Library:CreateWindow({
    Title = 'NaturalDisaster.pika',
    Center = true, 
    AutoShow = true,
})

local RunService = game:GetService("RunService")
local speaker = game.Players.LocalPlayer
local WhiteList = {}
local blacklist = {}

--cria uma nova aba
local Tabs = {
    Main = Window:AddTab('Main'), 
    PlayersMaliciuns = Window:AddTab('Players'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

--cria uma caixa dentro da aba onde fica as funcoes do cheat
local LeftGroupBox = Tabs.Main:AddLeftGroupbox('Local Player')
local MapToggles = Tabs.Main:AddRightGroupbox('Map')
local Sv = Tabs.Main:AddRightGroupbox('Server')
local PlayersMalic = Tabs.PlayersMaliciuns:AddLeftGroupbox('Give Tool')
local PlayersMalic1 = Tabs.PlayersMaliciuns:AddRightGroupbox('Kill Player')
local PlayersMalic2 = Tabs.PlayersMaliciuns:AddLeftGroupbox('Teleport Player')
local cmdstab = Tabs.PlayersMaliciuns:AddRightGroupbox('Commands')



local serverlow = Sv:AddButton('Server w/ Few People', function()
local module = loadstring(game:HttpGet"https://raw.githubusercontent.com/LeoKholYt/roblox/main/lk_serverhop.lua")()
module:Teleport(game.PlaceId)
end)

local playsound = Sv:AddButton('Play all the sounds', function()
    for i,v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("Sound") then
            v:Play()
        end
    end
end)

Sv:AddToggle('loopallsounds', {
    Text = 'Loop All Sounds',
    Default = false, -- Default value (true / false)
    Tooltip = 'chaos (this can be lag yourself, be aware)', -- Information shown when you hover over the toggle
})

Sv:AddToggle('muteallsounds', {
    Text = 'Loop Mute All Sounds',
    Default = false, -- Default value (true / false)
    Tooltip = 'yea this gives a fucking silence', -- Information shown when you hover over the toggle
})


function notify(title, msg, timee)
    local CoreGui = game:GetService("StarterGui")
    CoreGui:SetCore("SendNotification", {
        Title = title;
        Text = msg;
        Duration = timee;
    })
end
    
    


--auto farm toggle
LeftGroupBox:AddToggle('Farm', {
    Text = 'AutoFarm Wins',
    Default = false, -- Default value (true / false)
    Tooltip = 'loop teleport that will take you to the lobby', -- Information shown when you hover over the toggle
})


--forca do corpo q nem minha pika
LeftGroupBox:AddToggle('streng', {
    Text = 'Strong Character',
    Default = false, -- Default value (true / false)
    Tooltip = 'make your body turn hard like your pp\n(you can push players and parts of\n   the map that are not anchored)', -- Information shown when you hover over the toggle
})


LeftGroupBox:AddToggle('flingingF', {
    Text = 'Fling',
    Default = false, -- Default value (true / false)
    Tooltip = 'fuck people', -- Information shown when you hover over the toggle
})

LeftGroupBox:AddToggle('noclipe', {
    Text = 'Noclip',
    Default = false, -- Default value (true / false)
    Tooltip = 'Casper the Friendly Ghost :D', -- Information shown when you hover over the toggle
})

LeftGroupBox:AddToggle('AutoDelFallDamage', {
    Text = 'Auto Delete FallDamage',
    Default = false, -- Default value (true / false)
    Tooltip = "will delete falldamage every time you respawn\n(this will not add damage back, reset for that)", -- Information shown when you hover over the toggle
})

LeftGroupBox:AddToggle('spampop', {
    Text = 'Spam pop sound (req.ballon)',
    Default = false, -- Default value (true / false)
    Tooltip = "will make the sound of the balloon burst everytime", -- Information shown when you hover over the toggle
})


MapToggles:AddToggle('autodeletemeteor', {
    Text = 'Auto Delete Meteors',
    Default = false, -- Default value (true / false)
    Tooltip = 'delete meteors falling from the sky\n(disabling will not bring them back)', -- Information shown when you hover over the toggle
})

MapToggles:AddToggle('autodeletelava', {
    Text = 'Auto Delete Lava',
    Default = false, -- Default value (true / false)
    Tooltip = 'deleted lava coming out of the volcano', -- Information shown when you hover over the toggle
})

MapToggles:AddToggle('autodeletevirus', {
    Text = 'Auto Delete Virus',
    Default = false, -- Default value (true / false)
    Tooltip = 'deleted virus coming out from people', -- Information shown when you hover over the toggle
})

LeftGroupBox:AddToggle('autodeletetagdamage', {
    Text = "Don't Cold",
    Default = false, -- Default value (true / false)
    Tooltip = "prevents the player from taking damage from the cold", -- Information shown when you hover over the toggle
})

LeftGroupBox:AddToggle('autodeletetouch', {
    Text = "Auto Delete TouchInterest",
    Default = false, -- Default value (true / false)
    Tooltip = "delete TouchTransmitter, this prevents taking damage from some objects", -- Information shown when you hover over the toggle
})

MapToggles:AddToggle('autodeletefiredamage', {
    Text = "Auto Delete Fire Parts",
    Default = false, -- Default value (true / false)
    Tooltip = "deletes parts that are on fire", -- Information shown when you hover over the toggle
})



PlayersMalic:AddDropdown('ToolSelected', {
    Values = { 'GreenBalloon', 'Compass', 'RedApple', },
    Default = 1, -- number index of the value / string
    Multi = false, -- true / false, allows multiple choices to be selected

    Text = 'Select Tool',
    Tooltip = 'select the tool to give', -- Information shown when you hover over the textbox
})

PlayersMalic:AddInput('toolgiver', {
    Default = 'write here',
    Numeric = false, -- true / false, only allows numbers
    Finished = true, -- true / false, only calls callback when you press enter

    Text = 'Put the name player',
    Tooltip = 'give the tool to the player whose name you write', -- Information shown when you hover over the textbox

    Placeholder = 'put name', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text
})


PlayersMalic:AddLabel("obs: press 'enter' to confirm")
PlayersMalic:AddLabel("and dont put the fucking displ.name")

PlayersMalic:AddDivider()


PlayersMalic:AddToggle('loopgiveallplayers', {
    Text = "Loop GiveTool to all Survivors",
    Default = false, -- Default value (true / false)
    Tooltip = "give tool to all players\nthose who already had\nwill not be counted", -- Information shown when you hover over the toggle
})


PlayersMalic1:AddDropdown('KillMethod', {
    Values = { 'InstaKill(req.tool)', 'Fling', 'Void Player', },
    Default = 1, -- number index of the value / string
    Multi = false, -- true / false, allows multiple choices to be selected

    Text = 'Select Method',
    Tooltip = 'select the method to kill', -- Information shown when you hover over the textbox
})

PlayersMalic1:AddInput('playertokill', {
    Default = 'write here',
    Numeric = false, -- true / false, only allows numbers
    Finished = true, -- true / false, only calls callback when you press enter

    Text = 'Put the name player',
    Tooltip = "kill the player you write the name on", -- Information shown when you hover over the textbox

    Placeholder = 'put name', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text
})




PlayersMalic1:AddSlider('DistanceFling', {
    Text = 'Fling Distance',
    Default = 0,
    Min = 0,
    Max = 5,
    Rounding = 3,

    Compact = false, 
})

PlayersMalic2:AddDropdown('teleportmethod', {
    Values = { 'Lobby (save)', 'Bring', 'Map', },
    Default = 1, -- number index of the value / string
    Multi = false, -- true / false, allows multiple choices to be selected

    Text = 'Select Place',
    Tooltip = 'bored', -- Information shown when you hover over the textbox
})

PlayersMalic2:AddInput('tpplayer', {
    Default = 'write here',
    Numeric = false, -- true / false, only allows numbers
    Finished = true, -- true / false, only calls callback when you press enter

    Text = 'Put the name player',
    Tooltip = 'tp the player whose name you write', -- Information shown when you hover over the textbox

    Placeholder = 'put name', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text
})



PlayersMalic2:AddToggle('loopsaveallplayers', {
    Text = "Loop Save all Survivors",
    Default = false, -- Default value (true / false)
    Tooltip = "save all players, teleporting to the lobby", -- Information shown when you hover over the toggle
})


local printcmds = cmdstab:AddButton('Print Cmds', function()
    print("keep in mind these commands are for in-game players only\n",
    "!ballon\n",
    "!apple\n",
    "!compass\n",
    "if someone types one of these commands in chat it will be attached,\n and they received one of these items (if you have it)\n")
    notify('so','press F9 to see the available commands',5)
end)


--comandos
cmdstab:AddToggle('enablecmds', {
    Text = "Enable Commands",
    Default = false, -- Default value (true / false)
    Tooltip = "if enabled, people will be able to use them", -- Information shown when you hover over the toggle
})

cmdstab:AddInput('blacklistplayer', {
    Default = 'write name',
    Numeric = false, -- true / false, only allows numbers
    Finished = true, -- true / false, only calls callback when you press enter

    Text = 'blacklist player',
    Tooltip = 'prohibit players from using the commands', -- Information shown when you hover over the textbox

    Placeholder = 'put name', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text
})

cmdstab:AddInput('whitelistplayer', {
    Default = 'write name',
    Numeric = false, -- true / false, only allows numbers
    Finished = true, -- true / false, only calls callback when you press enter

    Text = 'whitelist player',
    Tooltip = 'only allow some players to use the commands', -- Information shown when you hover over the textbox

    Placeholder = 'put name', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text
})

cmdstab:AddToggle('enablecmdsonlyforwhitelist', {
    Text = "Enable Commands (only for Wt.List)",
    Default = false, -- Default value (true / false)
    Tooltip = "only whitelist players used the commands", -- Information shown when you hover over the toggle
})


local clearblacklist = cmdstab:AddButton('Clear Blacklist', function()
    table.clear(blacklist)
    notify('yes','cleaned',3)
end)
local clearwhitelist = cmdstab:AddButton('Clear Whitelist', function()
    table.clear(WhiteList)
    notify('yes','cleaned',3)
end)

clearblacklist:AddTooltip('clear the list of those entered')
clearwhitelist:AddTooltip('clear the list of those entered')



local nop = true
local UnFlingkill = PlayersMalic1:AddButton('Unfling', function()
    nop = false
end)

local Display = LeftGroupBox:AddButton('UnDisplay/Display MapVote', function()
 if game.Players.LocalPlayer.PlayerGui.MainGui.MapVotePage.Visible == false then
        game.Players.LocalPlayer.PlayerGui.MainGui.MapVotePage.Visible = true
        else
        game.Players.LocalPlayer.PlayerGui.MainGui.MapVotePage.Visible = false
    end
end)

local MyButton = MapToggles:AddButton('Delete Map', function()
for i,v in pairs(game:GetService("Workspace").Structure:GetChildren()) do
v:destroy()
end
end)

MapToggles:AddDivider()

MapToggles:AddLabel('probably some things are missing,\n      soon i will add more')



local MyButton1 = LeftGroupBox:AddButton('Delete FallDamage', function()
    if game:GetService("Players").LocalPlayer.Character:FindFirstChild('FallDamageScript') then
        game:GetService("Players").LocalPlayer.Character.FallDamageScript:destroy()
    end
end)

local warnn = true
local MyButton2 = LeftGroupBox:AddButton('AntiAfk', function()
    local bb=game:service'VirtualUser'
    game:service'Players'.LocalPlayer.Idled:connect(function()
        bb:CaptureController()bb:ClickButton2(Vector2.new())
    end)
    if warnn then
    notify('ok', 'got activated', 2)
    warnn = false
    else
    notify('bro', 'THIS FUCK IS ALREADY ACTIVATED',2)
    end
    
end)


MyButton:AddTooltip('delete the map structure (this is only in your view bozo)')
MyButton1:AddTooltip('go fuck yourself')
MyButton2:AddTooltip('skill issues')
serverlow:AddTooltip('you are sad')
Display:AddTooltip('open the page to vote for the next map')
printcmds:AddTooltip('hi')


LeftGroupBox:AddSlider('ws', {
    Text = 'WalkSpeed',
    Default = 16,
    Min = 16,
    Max = 350,
    Rounding = 1,

    Compact = false, 
})

LeftGroupBox:AddSlider('jp', {
    Text = 'JumpPower',
    Default = 50,
    Min = 50,
    Max = 500,
    Rounding = 1,

    Compact = false, 
})

LeftGroupBox:AddSlider('gravityy', {
    Text = 'Gravity',
    Default = 196.2,
    Min = 0,
    Max = 196.2,
    Rounding = 1,

    Compact = false, 
})



--desliga o cheat
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')
Library:OnUnload(function()
    print('Unloaded!')
    local CoreGui = game:GetService("StarterGui")

    CoreGui:SetCore("SendNotification", {
	Title = "Warn";
	Text = "don't run the script again, some functions will bug, rejoin the game for that";
	Duration = 5;
})
    Library.Unloaded = true
end)

MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Toggle Window bind: '):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' }) 
Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu











--[[   funcoes da library   ]]--
local function getPlayer(str)
    for _, plr in ipairs(game:GetService("Players"):GetPlayers()) do
        if plr.Name:lower():find("^"..str:lower()) then
            return tostring(plr)
        end
        
    end
end


local a = true
Options.blacklistplayer:OnChanged(function()
    if a then
        a = false
        else
    local blacklistthisplayer = getPlayer(tostring(Options.blacklistplayer.Value))
    local useridblack = game.Players[blacklistthisplayer].UserId
    table.insert(blacklist, useridblack)
    local mmmsg = tostring('user '..blacklistthisplayer..'has been blacklisted')
    notify('blocked',mmmsg,3)
    end
end)



Toggles.enablecmds:OnChanged(function()
    if Toggles.enablecmds.Value == false then
        Toggles.enablecmdsonlyforwhitelist:SetValue(false)
    end
    
end)




Toggles.loopallsounds:OnChanged(function()
    while true do
        wait()
        if Toggles.loopallsounds.Value then
            for i,v in pairs(game.Workspace:GetDescendants()) do
                if v:IsA("Sound") then
                    v:Play()
                end
            end
        else
            break
        end
    end
end)

Toggles.muteallsounds:OnChanged(function()
    while true do
        wait()
        if Toggles.muteallsounds.Value then
            for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
                if v:IsA("Sound") then
                    v:Stop()
                end
            end
        else
            break
        end
    end
end)

function getRoot(char)
	local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
	return rootPart
end

local speaker = game.Players.LocalPlayer

function tools(plr)
	if plr:FindFirstChildOfClass("Backpack"):FindFirstChildOfClass('Tool') or plr.Character:FindFirstChildOfClass('Tool') then
		return true
	end
end


function attach(speaker,target)
    local target1 = game.Players[target]
    if tools(speaker) then
		local char = speaker.Character
		local tchar = target1.Character
		local hum = speaker.Character:WaitForChild("Humanoid")
		local hrp = getRoot(speaker.Character)
		local hrp2 = getRoot(target1.Character)
		hum.Name = "1"
		local newHum = hum:Clone()
		newHum.Parent = char
		newHum.Name = "Humanoid"
		wait()
		hum:Destroy()
		workspace.CurrentCamera.CameraSubject = char
		newHum.DisplayDistanceType = "None"
		local tool = speaker:FindFirstChildOfClass("Backpack"):FindFirstChildOfClass("Tool") or speaker.Character:FindFirstChildOfClass("Tool")
		tool.Parent = char
		hrp.CFrame = hrp2.CFrame * CFrame.new(0, 0, 0) * CFrame.new(math.random(-100, 100)/200,math.random(-100, 100)/200,math.random(-100, 100)/200)
		local n = 0
		repeat
			wait(.1)
			n = n + 1
			hrp.CFrame = hrp2.CFrame
		until (tool.Parent ~= char or not hrp or not hrp2 or not hrp.Parent or not hrp2.Parent or n > 250) and n > 2
	else
		--notify('ahh menn','pls buy a gamepass bc u req. a tool')
	end
end

function toolchecker(toolname)
    if game.Players.LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild(toolname) then
		return true
	end
end

function equip(toolw)
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.name == toolw then
            v.Parent = game.Players.LocalPlayer.Character
        end
    end
end

Toggles.spampop:OnChanged(function()
    while true do
        wait()
        if Toggles.spampop.Value then
            if toolchecker('GreenBalloon') or game.Players.LocalPlayer.Character:FindFirstChild('GreenBalloon') then
                equip('GreenBalloon')
                game.Players.LocalPlayer.Character.GreenBalloon.Handle.Pop:Play()
                else
                    Toggles.spampop:SetValue(false)
                notify('bro', 'where is your balloon?',3)
            end
            --putaria
            else
            break
        end
    end
end)



local aindaNao = true
Options.toolgiver:OnChanged(function()
    if aindaNao then
        aindaNao = false
        else
        local targetname = getPlayer(tostring(Options.toolgiver.Value))
        if targetname ~= nil then
    
    local speaker = game.Players.LocalPlayer
    
    local targetinplayerlist = game.Players[tostring(targetname)]
    local targetchar = (targetinplayerlist).Character
    
    if tools(speaker) and toolchecker(tostring(Options.ToolSelected.Value)) then
        if targetname ~= nil then
        local char = speaker.Character
        local tchar = (targetinplayerlist).Character
        local hum = speaker.Character:FindFirstChildOfClass("Humanoid")
        local hrp = getRoot(speaker.Character)
        local hrp2 = getRoot((targetinplayerlist).Character)
        hum.Name = "1"
        local newHum = hum:Clone()
		newHum.Parent = char
		newHum.Name = "Humanoid"
		wait()
		hum:Destroy()
        game:GetService("Workspace").CurrentCamera.CameraSubject = char
        newHum.DisplayDistanceType = "None"
		local tool = speaker:FindFirstChildOfClass("Backpack"):FindFirstChild(tostring(Options.ToolSelected.Value))
		tool.Parent = char
		hrp.CFrame = hrp2.CFrame * CFrame.new(0, 0, 0) * CFrame.new(math.random(-100, 100)/200,math.random(-100, 100)/200,math.random(-100, 100)/200)
		local n = 0
		repeat
			wait(.1)
			n = n + 1
			hrp.CFrame = hrp2.CFrame
		until (tool.Parent ~= char or not hrp or not hrp2 or not hrp.Parent or not hrp2.Parent or n > 250) and n > 2
		else
		    local msg1 = "you don't have the FUCKING "..tostring(Options.ToolSelected.Value).." asf"
		    notify('nicca',msg1,3)
		    end
        end
        else
            notify('nicca','this player does not exist\nru a dog...',3)
        end
    
    end
end)

function brekvelocity(cor)
    for i=1,10 do
        wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
        game.Players.LocalPlayer.Character.Torso.Velocity = Vector3.new(0,0,0)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(cor)
    end
end


function checkvelocity(target)
    local targetvelocity = game.Players[target].Character.HumanoidRootPart
    local perm = true
    if targetvelocity.Velocity.X < 0 then
        if targetvelocity.Velocity.X < -100 then
                perm = false
                return false
            else
                return true
        end
    else
    if targetvelocity.Velocity.X >= 0 and perm then
        if targetvelocity.Velocity.X > 100 then
                perm = false
                return false
            else
                return true
            end
        end
    end
    if targetvelocity.Velocity.Z < 0 and perm then
        if targetvelocity.Velocity.Z < -100 then
                perm = false
                return false
            else
                return true
        end
    else
    if targetvelocity.Velocity.Z >= 0 and perm then
        if targetvelocity.Velocity.Z > 100 then
                perm = false
                return false
            else
                return true
            end
        end
    end
    if targetvelocity.Velocity.Y < 0 and perm then
        if targetvelocity.Velocity.Y < -100 then
                perm = false
                return false
            else
                return true
        end
    else
    if targetvelocity.Velocity.Y >= 0 and perm then
        if targetvelocity.Velocity.Y > 100 then
                perm = false
                return false
            else
                return true
            end
        end
    end
end

local avisotalvez = true
local aindaNao1 = true
local permitido = false
Options.playertokill:OnChanged(function()
    if aindaNao1 then
        aindaNao1 = false
        
        else
            
            if tools(speaker) then
                permitido = true
                else
                permitido = false
                notify('nicca',"u don't have a tool",3)
            end
            if getPlayer(tostring(Options.playertokill.Value)) ~= nil then
                permitido = true
                else
                permitido = false
                notify('nicca','this player does not exist\nru a dog...',3)
            end
            
            
            if Options.KillMethod.Value == 'InstaKill(req.tool)' and permitido then
                if avisotalvez then
                        avisotalvez = false
                        notify('hellp',"sometimes it doesn't work\ntry again if not",5)
                        end
                local e = getPlayer(tostring(Options.playertokill.Value))
                
                    if tools(speaker) then
                    local LocalPlayer = game.Players.LocalPlayer
                    Instance.new("Humanoid", LocalPlayer.Character)
                    LocalPlayer.Character.Humanoid:Destroy()
                    local tool = LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
                    local Player = game.Players:FindFirstChild(e)
                    tool.Parent = LocalPlayer.Character
                    LocalPlayer.Character["Right Arm"].CFrame = Player.Character.Head.CFrame
                    Player.Character:SetPrimaryPartCFrame(tool.Handle.CFrame)
                    repeat wait()
                        LocalPlayer.Character["Right Arm"].CFrame = Player.Character.Head.CFrame
                    Player.Character:SetPrimaryPartCFrame(tool.Handle.CFrame)
                        until tool.Parent ~= LocalPlayer.Character
                    LocalPlayer.Character.Humanoid.Health = 0
                    LocalPlayer.Character = nil
                    end
                
            elseif Options.KillMethod.Value == 'Fling' and permitido then
                Toggles.flingingF:SetValue(true)
                nop = true
                local pl = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                local target1 = getPlayer(tostring(Options.playertokill.Value))
                if target1 ~= nil then
                while true do
                    wait()
                    if checkvelocity(target1) then
                        if nop then
                        local targetchar = game.Players[target1].Character.HumanoidRootPart.Position
                        local targetdirection = game.Players[target1].Character.HumanoidRootPart.Velocity
                        local slide = Options.DistanceFling.Value
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(targetchar.X + (targetdirection.X*slide), targetchar.Y, targetchar.Z + (targetdirection.Z*slide))
                        
                        else
                            Toggles.flingingF:SetValue(false)
                            notify('wsp', 'fling has stoped', 2)
                            brekvelocity(pl)
                        

                        break
                        end
                        else 
                            Toggles.flingingF:SetValue(false)
                            notify('wsp', 'i think the guy got flinged', 2)
                            brekvelocity(pl)
                        
                        break
                        end

                end
                end
                
            elseif Options.KillMethod.Value == 'Void Player' and permitido then
                if avisotalvez then
                avisotalvez = false
                notify('hellp',"sometimes it doesn't work\ntry again if not",5)
                end
                local e = getPlayer(tostring(Options.playertokill.Value))
                if e ~= nil then
                local LocalPlayer = game.Players.LocalPlayer
                Instance.new("Humanoid", LocalPlayer.Character)
                LocalPlayer.Character.Humanoid:Destroy()
                local tool = LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
                local Player = game.Players:FindFirstChild(e)
                tool.Parent = LocalPlayer.Character
                LocalPlayer.Character["Right Arm"].CFrame = Player.Character.Head.CFrame
                Player.Character:SetPrimaryPartCFrame(tool.Handle.CFrame)
                repeat wait() until tool.Parent ~= LocalPlayer.Character
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9999999, 9999999, 9999999)
                end
            end
        
    end
end)

local aindaNao2 = true
Options.tpplayer:OnChanged(function()
    if aindaNao2 then
        aindaNao2 = false
        else
        local target3 = getPlayer(tostring(Options.tpplayer.Value))
        if target3 ~= nil then
            if Options.teleportmethod.Value == 'Lobby (save)' then
                ---323, 180, 330 posicao do lobby
                if tools(speaker) then
                local NormPos = CFrame.new(-237.0693359375, 179.4999542236328, 342.8241882324219)
                    attach(speaker, target3)
                    speaker.Character.HumanoidRootPart.CFrame = NormPos
                else
                notify('goofy ahh','u need a tool bozo',2)
                end
            elseif Options.teleportmethod.Value == 'Bring' then
            if tools(speaker) then
                local NormPos = speaker.Character.HumanoidRootPart.CFrame
                attach(speaker, target3)
                speaker.Character.HumanoidRootPart.CFrame = NormPos
            else
            notify('goofy ahh','u need a tool bozo',2)
            end
            elseif Options.teleportmethod.Value == 'Map' then
                if tools(speaker) then
                    local NormPos = CFrame.new(-94.5226288, 55.8398094, -45.2254715, 4.29841202e-05, 0.984807789, -0.173647895, -9.95239002e-09, 0.173647895, 0.984807789, 1, -4.23293677e-05, 7.47390277e-06)
                    attach(speaker, target3)
                    speaker.Character.HumanoidRootPart.CFrame = NormPos
                    else
                    notify('goofy ahh','u need a tool bozo',2)
                end
            end
        end
    end
end)



--teleport TweenService function
local teleport1 = CFrame.new(-269.483154296875, 179.59996032714844, 382.1812438964844)
local teleport = Vector3.new(-269.483154296875, 179.59996032714844, 382.1812438964844)
local rt = game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').CFrame

function tp1(cord)
local New_CFrame = cord
local ts = game:GetService("TweenService")
local uis = game:GetService("UserInputService")
local char = game.Players.LocalPlayer.Character
local part = char.HumanoidRootPart
local ti = TweenInfo.new(0.5, Enum.EasingStyle.Linear)
local tp = {CFrame = New_CFrame}
ts:Create(part, ti, tp):Play()
end


function DelAndTp()
    if game:GetService("Players").LocalPlayer.Character:FindFirstChild('FallDamageScript') then
        game:GetService("Players").LocalPlayer.Character.FallDamageScript:destroy()
    end
    
    if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart') then
        local rt = game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').CFrame.Position
        local magnitudefarm = (teleport - rt).Magnitude
        if magnitudefarm > 10 then
        tp1(teleport1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
        game.Players.LocalPlayer.Character:FindFirstChild('Torso').Velocity = Vector3.new(0,0,0)
        end
    end
end




--autofarm
Toggles.Farm:OnChanged(function()
    while true do
        wait(0.4)
        if Toggles.Farm.Value then
            if game:GetService("Players").LocalPlayer.Character:FindFirstChild('HumanoidRootPart') then
                wait(0.3)
                DelAndTp()
            end
            else
            break
        end
        wait(0.4)
    end
end)

--funcao que deleta o FallDamageScript enquanto estiver >true<
Toggles.AutoDelFallDamage:OnChanged(function()
while true do
    wait(1)
    if Toggles.AutoDelFallDamage.Value == true then
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild('FallDamageScript') then
            game:GetService("Players").LocalPlayer.Character.FallDamageScript:destroy()
        end
        else
        break
    end
end
end)

--funcao que deleta os meteoros
Toggles.autodeletemeteor:OnChanged(function()
while true do
    wait(0.5)
    if Toggles.autodeletemeteor.Value == true then
        for i,v in pairs(game:GetService("Workspace").Structure:GetDescendants()) do
            if (v.Name:sub(1, 6)) == "Meteor" then
                v:destroy()
            end
        end
        else
            break
    end
end
end)

--funcao que deleta a lava do vulcao
Toggles.autodeletelava:OnChanged(function()
while true do
    wait(0.2)
    if Toggles.autodeletelava.Value == true then
        for i,v in pairs(game:GetService("Workspace").Structure:GetDescendants()) do
            if (v.Name:sub(1, 4)) == "Lava" then
                v:destroy()
            end
        end
        else
            break
    end
end
end)

--funcao que deleta o virus das pessoas
Toggles.autodeletevirus:OnChanged(function()
while true do
    wait()
    if Toggles.autodeletevirus.Value == true then
        for i,v in pairs(game:GetService("Workspace").Structure:GetDescendants()) do
            if (v.Name:sub(1, 5)) == "Virus" then
                v:destroy()
            end
        end
        else
            break
    end
end
end)


--funcao que tira o ExposureTag para evitar dano do frio
Toggles.autodeletetagdamage:OnChanged(function()
    while true do
        wait(0.5)
        if Toggles.autodeletetagdamage.Value then
            if game.Players.LocalPlayer.Character:FindFirstChild('SurvivalTag') and game.Players.LocalPlayer.Character.SurvivalTag:FindFirstChild('ExposureTag') then
            game.Players.LocalPlayer.Character.SurvivalTag.ExposureTag:destroy()
            end
            else
            break
        end
    end
end)

--funcao que retira o evento de tocar em objetos (TouchInterest)
Toggles.autodeletetouch:OnChanged(function()
    while true do
        wait()
        if Toggles.autodeletetouch.Value then
            wait(3)
            for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
                if v.Name == 'TouchInterest' then
                    v:destroy()
                end
            end
            else
            break
        end
    end
end)

--funcao que destroe partes que estao pegando fogo
Toggles.autodeletefiredamage:OnChanged(function()
    while true do
        wait(0.5)
        if Toggles.autodeletefiredamage.Value then
            for i,v in pairs(game:GetService("Workspace").Structure:GetDescendants()) do
                if v.Name == 'FireTag' then
                    v.Parent:destroy()
                end
            end
            else
            break
        end
    end
end)

--funcao que altera o WalkSpeed
local aviso = false
Options.ws:OnChanged(function()
    if aviso == false and game.Players.LocalPlayer.Character:FindFirstChild('FallDamageScript') and game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed > 30 then
        aviso = true
            local CoreGui = game:GetService("StarterGui")
            CoreGui:SetCore("SendNotification", {
            	Title = "Warn";
            	Text = "is recommended that you delete falldamage so you don't take damage for your velocity";
            	Duration = 5;
            })
        end
    game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = Options.ws.Value
end)

--funcao que altera o JumpPower
local aviso1 = false
Options.jp:OnChanged(function()
    if aviso1 == false and game.Players.LocalPlayer.Character:FindFirstChild('FallDamageScript') and game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower > 51 then
        aviso1 = true
            local CoreGui = game:GetService("StarterGui")
            CoreGui:SetCore("SendNotification", {
            	Title = "Warn";
            	Text = "is recommended that you delete falldamage so you don't take damage for your velocity";
            	Duration = 5;
            })
        end
    game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = Options.jp.Value
end)

Options.gravityy:OnChanged(function()
    game:GetService("Workspace").Gravity = Options.gravityy.Value
end)

Toggles.streng:OnChanged(function()
    while true do
        wait()
        if Toggles.streng.Value == true then
        for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA('Part') then
                v.CustomPhysicalProperties = PhysicalProperties.new(100, 0.3, 0.5)
            end
        end
        else
        for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA('Part') then
                v.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5)
            end
        end
        break
        end
    end
end)


Toggles.noclipe:OnChanged(function()
       
    coroutine.wrap(function()
            
    local Noclipping = nil
    
    local function NoclipLoop()
		if Toggles.noclipe.Value and game.Players.LocalPlayer.Character ~= nil then
			for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if child:IsA("BasePart") and child.CanCollide == true then
					child.CanCollide = false
				end
			end
			else
			Noclipping:Disconnect()
			
		end
	end
    Noclipping = RunService.Stepped:Connect(NoclipLoop)
	
    end)()
end)

function randomString()
	local length = math.random(10,20)
	local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32, 126))
	end
	return table.concat(array)
end


local speaker = game.Players.LocalPlayer
flinging = false
Toggles.flingingF:OnChanged(function()
    if Toggles.flingingF.Value == true then
        local speaker = game.Players.LocalPlayer
        flinging = false
        for _, child in pairs(speaker.Character:GetDescendants()) do
		    if child:IsA("BasePart") then
			    child.CustomPhysicalProperties = PhysicalProperties.new(math.huge, 0.3, 0.5)
		    end
        end
        Toggles.noclipe:SetValue(true)
        Toggles.streng:SetValue(false)
	    wait(.1)
	    local bambam = Instance.new("BodyAngularVelocity")
	    bambam.Name = randomString()
    	bambam.Parent = getRoot(speaker.Character)
    	bambam.AngularVelocity = Vector3.new(0,99999,0)
    	bambam.MaxTorque = Vector3.new(0,math.huge,0)
    	bambam.P = math.huge
    	local Char = speaker.Character:GetChildren()
    	for i, v in next, Char do
    		if v:IsA("BasePart") then
    			v.CanCollide = false
    			v.Massless = true
    			v.Velocity = Vector3.new(0, 0, 0)
    		end
    	end
    	flinging = true
    	local function flingDiedF()
    		Toggles.flingingF:SetValue(false)
    	end
    	flingDied = speaker.Character:FindFirstChildOfClass('Humanoid').Died:Connect(flingDiedF)
    	
    	coroutine.wrap(function()
    	repeat
    		bambam.AngularVelocity = Vector3.new(0,99999,0)
    		wait(.2)
    		bambam.AngularVelocity = Vector3.new(0,0,0)
    		wait(.1)
    	until flinging == false
    	end)()
    	
        else
            
        Toggles.noclipe:SetValue(false)
        if flingDied then
		    flingDied:Disconnect()
        end
        flinging = false
    	wait(.1)
        local speakerChar = speaker.Character
	    if not speakerChar or not getRoot(speakerChar) then return end
	    for i,v in pairs(getRoot(speakerChar):GetChildren()) do
		    if v.ClassName == 'BodyAngularVelocity' then
			    v:Destroy()
		    end
	    end
	    for _, child in pairs(speakerChar:GetDescendants()) do
		    if child.ClassName == "Part" or child.ClassName == "MeshPart" then
			    child.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5)
		    end
	    end
        
        
        
        
    end
end)

Toggles.loopsaveallplayers:OnChanged(function()
    if Toggles.loopsaveallplayers.Value then
        local center = Vector3.new(-279.4526672363281, 179.4999542236328, 340.2077941894531)
        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
            local magnitude = (v.Character.HumanoidRootPart.Position - center).Magnitude
            if v ~= game.Players.LocalPlayer and v.Character:FindFirstChild('SurvivalTag') and v.Character.Humanoid.Health ~= 0 and magnitude > 75 and Toggles.loopsaveallplayers.Value and v.Character.Humanoid.Sit ~= true then
                repeat wait()
                local magnitude = (v.Character.HumanoidRootPart.Position - center).Magnitude
                attach(speaker, tostring(v))
                local NormPos = CFrame.new(-237.0693359375, 179.4999542236328, 342.8241882324219)
                speaker.Character.HumanoidRootPart.CFrame = NormPos
                until magnitude < 75 or Toggles.loopsaveallplayers.Value == false
            end
        end
        Toggles.loopsaveallplayers:SetValue(false)
        notify('wo', 'apparently everyone is safe (or dead lol)', 4)
            
        
    end
end)

function searchfortool(player1, thetool)
    if player1.Character:FindFirstChild(thetool) or player1.Backpack:FindFirstChild(thetool) then
        return false
        else
        return true
    end
end


Toggles.loopgiveallplayers:OnChanged(function()
    if Toggles.loopgiveallplayers.Value then
        local center = Vector3.new(-279.4526672363281, 179.4999542236328, 340.2077941894531)
        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
            local tl = tostring(Options.ToolSelected.Value)
            if v ~= game.Players.LocalPlayer and v.Character.Humanoid.Health ~= 0 and Toggles.loopgiveallplayers.Value and searchfortool(v, tl) then
                repeat wait()
                attach(speaker, tostring(v))
                until v.Character:FindFirstChild(tl) or v.Backpack:FindFirstChild(tl) or Toggles.loopgiveallplayers.Value == false
            end
        end
        Toggles.loopgiveallplayers:SetValue(false)
        notify('wo', 'apparently everyone have this item', 4)
    end
end)


function attachALT(speaker,target,ToolToUse)
    local target1 = game.Players[target]
    if tools(speaker) then
        if speaker:FindFirstChildOfClass(ToolToUse):FindFirstChildOfClass(ToolToUse) or speaker.Character:FindFirstChildOfClass(ToolToUse) then
		local char = speaker.Character
		local tchar = target1.Character
		local hum = speaker.Character:WaitForChild("Humanoid")
		local hrp = getRoot(speaker.Character)
		local hrp2 = getRoot(target1.Character)
		hum.Name = "1"
		local newHum = hum:Clone()
		newHum.Parent = char
		newHum.Name = "Humanoid"
		wait()
		hum:Destroy()
		workspace.CurrentCamera.CameraSubject = char
		newHum.DisplayDistanceType = "None"
		local tool = speaker:FindFirstChildOfClass(ToolToUse):FindFirstChildOfClass(ToolToUse) or speaker.Character:FindFirstChildOfClass(ToolToUse)
		tool.Parent = char
		hrp.CFrame = hrp2.CFrame * CFrame.new(0, 0, 0) * CFrame.new(math.random(-100, 100)/200,math.random(-100, 100)/200,math.random(-100, 100)/200)
		local n = 0
		repeat
			wait(.1)
			n = n + 1
			hrp.CFrame = hrp2.CFrame
		until (tool.Parent ~= char or not hrp or not hrp2 or not hrp.Parent or not hrp2.Parent or n > 250) and n > 2
		else
		return false
		end
	end
end

local Prefix = "!" 
function checkAdmin(player)
    if Toggles.enablecmdsonlyforwhitelist.Value then
    	for i,v in ipairs(WhiteList) do
    		if type(v) == 'number' and player.UserId == v then
    		    return true
    		    else
    		    return false
    	    end
    	end
    	else
    	return true
    end
end


function checkBlackList(player)
	for i,v in ipairs(blacklist) do
		if type(v) == 'number' and player.UserId == v then
		    return false
		    else
		    return true
	    end
    end
end

for _,plr in pairs(game:GetService("Players"):GetPlayers()) do
    if plr ~= game.Players.LocalPlayer then
        plr.Chatted:Connect(function(msg)
			local loweredString = string.lower(msg)
			local args = string.split(loweredString," ")
			local targett = tostring(plr.Name)
			if Toggles.enablecmds.Value and checkAdmin(plr) and checkBlackList(plr) and args[1] == Prefix.."balloon" then
            attachALT(speaker,targett,'GreenBalloon')
            elseif Toggles.enablecmds.Value and checkAdmin(plr) and checkBlackList(plr) and args[1] == Prefix.."apple" then
			attachALT(speaker,targett,'RedApple')
            elseif Toggles.enablecmds.Value and checkAdmin(plr) and checkBlackList(plr) and args[1] == Prefix.."compass" then
			attachALT(speaker,targett,'Compass')
			end
		end)
    end
end

game.Players.PlayerAdded:Connect(function(plr)
    plr.Chatted:Connect(function(msg)
		local loweredString = string.lower(msg)
		local args = string.split(loweredString," ")
		local targett = tostring(plr.Name)
		if Toggles.enablecmds.Value and checkAdmin(plr) and checkBlackList(plr) and args[1] == Prefix.."balloon" then
            attachALT(speaker,targett,'GreenBalloon')
            elseif Toggles.enablecmds.Value and checkAdmin(plr) and checkBlackList(plr) and args[1] == Prefix.."apple" then
			attachALT(speaker,targett,'RedApple')
            elseif Toggles.enablecmds.Value and checkAdmin(plr) and checkBlackList(plr) and args[1] == Prefix.."compass" then
			attachALT(speaker,targett,'Compass')
		end
	end)
end)

--[[        outras funcoes externas           ]]--






    

