-- Para usar este script basta equipar o Skibidi Toilet que tem o Dual Laser
-- Logo quando você equipar, selecione a arma que é o Dual Laser e execute o script logo não tera mais cooldown nos ataques

local player = game:GetService("Players").LocalPlayer
local remoteEvent = player.Character:FindFirstChild("Dual Laser").RemoteEvent

local function fireLaser(direction)
    local args = {
        [1] = direction
    }
    remoteEvent:FireServer(unpack(args))
end

local mouse = player:GetMouse()
local isMouse1Pressed = false

mouse.Button1Down:Connect(function()
    isMouse1Pressed = true
    while isMouse1Pressed do
        local ray = Workspace:Raycast(mouse.UnitRay.Origin, mouse.UnitRay.Direction * 1000)  
        if ray then
            local hitPosition = ray.Position
            fireLaser(hitPosition)
        end
        wait()
    end
end)

mouse.Button1Up:Connect(function()
    isMouse1Pressed = false
end)
