local Players = game:GetService("Players")
local module = {
	Limit = 4,
}
module.__index = module
--Fires when a party is created
function module.new(Player: Player?): Party
	local self = {
		Name = nil,
		Players = {},
	}
	setmetatable(self, module)
	--Adds the Player to the party and sets the name to the Player's name
	if Player and Player:IsA("Player") then
		self:addPlayer(Player)
		self:changeName(Player.Name + "'s Party")
	end
	return self
end
--Changes the name of the party
function module:changeName(Name: string)
	self.Name = Name
end
--Adds Player to party
function module:addPlayer(Player: Player)
	if self:isFull() then
		return
	end

	local PartyLocations = game.Workspace.PartyLocations:Clone()
end
--Fires when a player in the party joins a different party
function module:PlayerJoinedAnotherParty(Player: Player)
	self:removePlayer(Player)
	--TODO
end
--Fires when a player in the party leaves the party
function module:PlayerLeftParty(Player: Player)
	self:removePlayer(Player)
	--TODO
end
--Fires when a player in the party leaves the game
function module:PlayerLeftGame(Player: Player)
	self:removePlayer(Player)
end
--Fires when you want to remove a player from the party
function module:removePlayer(Player: Player)
	local Pos = self:getPlayerPos(Player)
	if Pos then
		table.remove(self.Players, Pos)
	end
end
--Gets whether the Party is full or not
function module:isFull(): boolean
	return #self.Players >= self.Limit
end
--Gets the Player's position in the party (i.e. 1, 2, 3, 4)
function module:getPlayerPos(Player: Player): number
	for i = 1, #self.Players do
		if Player == self.Players[i] then
			return i
		end
	end
	return 0
end
--Gets the Party System Class
function module.getPartySystem()
	return script.Parent.Parent.getPartySystem:Invoke()
end
--Gets whether the Party has the player or not
function module:hasPlayer(Player: Player): boolean
	for i, v in pairs(self.Players) do
		if Player == v then
			return true
		end
	end
	return false
end
--Properties of Party
export type OriParty = {
	Players: { [number]: string },
	Name: string,
}
--Type of the whole Party
export type Party = typeof(setmetatable({}, module)) & OriParty -- Types (may not be necessary)

return module
