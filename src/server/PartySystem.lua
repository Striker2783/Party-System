local PartyMod = require(script.Parent.Party) --Here

local module = {}
module.__index = module

function module.new()
	local self = {
		Parties = {}, --Want to store Party objec
	}
	setmetatable(self, module)
	game.Players.PlayerAdded:Connect(function(player)
		self:playerJoined(player)
	end)
	game.Players.PlayerRemoving:Connect(function(player)
		self:playerLeft(player)
	end)
	return self
end

function module:playerLeft(Player: Player) end

function module:playerJoined(Player: Player)
	self:newParty(Player)
end

function module:newParty(Player: Player)
	if not game.Players:GetPlayerByUserId(Player.UserId) then
		return
	end
	local newParty = PartyMod.new(Player)
end

function module:startParty() end

function module:removeParty() end

return module
