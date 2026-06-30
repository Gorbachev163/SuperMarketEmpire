local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Config = require(ReplicatedStorage.Config)
local DataService = require(script.Parent.DataService)

Players.PlayerAdded:Connect(function(player)

	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local Money = Instance.new("IntValue")
	Money.Name = "Money"

	local savedMoney = DataService.LoadMoney(player)

	if savedMoney ~= nil then
		Money.Value = savedMoney
	else
		Money.Value = Config.StartMoney
	end

	Money.Parent = leaderstats

end)
