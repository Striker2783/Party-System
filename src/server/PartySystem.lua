local PartyMod = require(script.Parent.Party) --Here

local module = {}
module.__index = module -- set as metamethod

function module.new()
	local self = {
		Parties = {},
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

function module:findPartyFromPlayer(Player: Player): PartyMod.Party
	for i, v in pairs(self.Parties) do
		if v:hasPlayer(Player) then
			return v
		end
	end
end

function module:playerLeft(Player: Player)
	local Party = self:findPartyFromPlayer(Player)
	if not Party then
		return
	end
	Party:PlayerLeftGame()
end

function module:playerJoined(Player: Player)
	self:newParty(Player)
end

function module:newParty(Player: Player)
	if not game.Players:GetPlayerByUserId(Player.UserId) then
		return
	end
	local newParty = PartyMod.new(Player)
end

function module:partyChangedName()
	--TODO
end

function module:startParty()
	--TODO
end

function module:removeParty()
	--TODO
end

export type PartySystem = typeof(setmetatable({}, module)) & {
	Parties: { [number]: PartyMod.Party },
}

return module
