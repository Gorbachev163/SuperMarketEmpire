local DataStoreService = game:GetService("DataStoreService")
local Players = game:GetService("Players")

local MoneyStore = DataStoreService:GetDataStore("PlayerMoney_v1")

local DataService = {}

function DataService.LoadMoney(player)
	local success, data = pcall(function()
		return MoneyStore:GetAsync(player.UserId)
	end)

	if success and data then
		return data
	end

	return nil
end

function DataService.SaveMoney(player)
	local leaderstats = player:FindFirstChild("leaderstats")
	if not leaderstats then
		return
	end

	local money = leaderstats:FindFirstChild("Money")
	if not money then
		return
	end

	pcall(function()
		MoneyStore:SetAsync(player.UserId, money.Value)
	end)
end

Players.PlayerRemoving:Connect(function(player)
	DataService.SaveMoney(player)
end)

game:BindToClose(function()
	for _, player in ipairs(Players:GetPlayers()) do
		DataService.SaveMoney(player)
	end
end)

return DataService
