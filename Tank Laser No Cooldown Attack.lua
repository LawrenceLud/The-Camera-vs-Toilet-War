-- Para usar este script basta equipar o Tank Laser Padrão da equipe dos Camera Man 
-- Logo quando você equipar, selecione a arma que é o Laser e execute o script logo não tera mais cooldown nos ataques

local player = game:GetService("Players").LocalPlayer
local remoteEvent = player.Character.TankLaser.RemoteEvent

local function fireLaser(position)
    local args = {
        [1] = position
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
