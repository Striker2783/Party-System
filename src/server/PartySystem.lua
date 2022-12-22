local PartyMod = require(script.Parent.Party) --Here

local module = {}
module.__index = module -- set as metamethod
--Fires when new Party System is created
function module.new(): PartySystem
	local self: OriPartySystem = { --Properties of this system
		Parties = {},
	}
	setmetatable(self, module)
	game.Players.PlayerAdded:Connect(function(player)
		self:playerJoined(player) --Whenever a player joins, fire this
	end)
	game.Players.PlayerRemoving:Connect(function(player)
		self:playerLeft(player) --Whenever a player leaves, fire this
	end)
	return self
end
--Finds the party with the player in it
function module:findPartyFromPlayer(Player: Player): PartyMod.Party?
	for i, v in pairs(self.Parties) do
		if v:hasPlayer(Player) then
			return v
		end
	end
end
--Fires when a player leaves
function module:playerLeft(Player: Player)
	local Party = self:findPartyFromPlayer(Player)
	if not Party then
		return
	end
	Party:PlayerLeftGame()
end
--Fires when a player joins
function module:playerJoined(Player: Player)
	self:newParty(Player)
end
--Creates a new Party
function module:newParty(Player: Player)
	if not game.Players:GetPlayerByUserId(Player.UserId) then
		return
	end
	local newParty = PartyMod.new(Player)
	self.Parties[newParty.Name] = newParty;
end
--Fires when the name of the party changes
function module:partyChangedName()
	--TODO
end
--Fires when a party decides to play or start
function module:startParty()
	--TODO
end
--Removes the party from the system
function module:removeParty()
	--TODO
end
--properties of this system
export type OriPartySystem = {
	Parties: { [number]: PartyMod.Party },
}
--Type of the whole system including metamethods
export type PartySystem = typeof(setmetatable({}, module)) & OriPartySystem

return module
