local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
local player = game.Players.LocalPlayer

local X = library.Load({
	Title = "EzPezDoors - by мельница#6572",
	Style = 1,
	SizeX = 500,
	SizeY = 350,
	Theme = "Dark",
	ColorOverrides = {
		MainFrame = Color3.fromRGB(125,125,125)
	}
})

local DefaultPage = X.New({
    Title = "Main page"
})
local OpPage = X.New({
    Title = "OP Stuff" 
})

OpPage.Button({
    Text = "Remove A-90",
    Callback = function()
      player.PlayerGui:WaitForChild("MainUI"):WaitForChild("Jumpscare"):FindFirstChild("Jumpscare_A90").Parent = nil
      game.ReplicatedStorage:WaitForChild("EntityInfo"):WaitForChild("A90").Parent = nil
      while task.wait() do
        game.SoundService.Main.Volume = 1 
      end
    end
})

OpPage.Button({
    Text = "AutoBot A-1000",
    Callback = function(value)
      local char = game.Players.LocalPlayer.Character
local PathfindingService = game:GetService("PathfindingService")
 
local path = PathfindingService:CreatePath({
    AgentCanJump = false
})

-- кнопка экстренной остановки скрипта
local emergencystop = false
game.UserInputService.InputEnded:Connect(function(inputObject,PE)
	if inputObject.KeyCode == Enum.KeyCode.P and PE == false then
		emergencystop = true
	end
end)
while true do
    player.Character.humfake.WalkSpeed = 50
    if emergencystop == true or workspace.CurrentRooms:GetChildren()[#workspace.CurrentRooms:GetChildren() - 1].Name == "998" then break end
    
    path:ComputeAsync(char.HumanoidRootPart.Position, workspace.CurrentRooms:GetChildren()[#workspace.CurrentRooms:GetChildren() - 1].Door.Door.Position)
    local waypoints = path:GetWaypoints()

    if workspace:FindFirstChild("A120") then
        workspace.A120.Destroying:Wait()
    end


    for k, waypoint in pairs(waypoints) do
        if emergencystop == true then break end
        char.humfake:MoveTo(waypoint.Position)
        
        -- change humanoid state to jump if necessary
        if waypoint.Action == Enum.PathWaypointAction.Jump then
            humfake:ChangeState(Enum.HumanoidStateType.Jumping)
        end
        
        char.humfake.MoveToFinished:Wait()
    end
    wait(0.1)
end
  end})

local hum
  if player.Character:FindFirstChild("humfake") then
    hum = player.Character.humfake
  elseif player.Character:FindFirstChild("Humanoid") then
    hum = player.Character.Humanoid
  end


OpPage.Toggle({
    Text = "Anti-Cheat Bypass",
    Callback = function(value)
      if value == true then
        if player.Character:FindFirstChild("Humanoid") then
          local newhum = hum:Clone()
          newhum.Name = "humfake"
          newhum.Parent = player.Character
          task.wait()

          hum.Parent = nil
        end
    else
      if hum.Parent == nil then
        hum.Parent = player.Character
        player.Character.humfake:Destroy()
      end
    end
  end,
  })
