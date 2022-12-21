local Players = game:GetService("Players")
local module = {
    Limit = 4;
}
module.__index = module;

function module.new(Player: Player?)
    local self = {
        Name = nil;
        Players = {
        }
    }
    setmetatable(self, module)
    if (Player and Player:IsA("Player")) then
        self:addPlayer(Player);
        self:changeName(Player.Name);
    end
    return self;
end

function module:changeName(Name: string)
    self.Name = Name;
end

function module:addPlayer(Player: Player)
    if (self:isFull()) then return end;
    
    local PartyLocations = game.Workspace.PartyLocations:Clone();
    
end

function module:removePlayer(Player: Player)
    
end

function module:start()
    
end

function module:isFull(): boolean
    return #self.Players >= self.Limit;
end

function module:getPlayerPos(Player: Player): number
    for i = 1, #self.Players do
        if (Player == self.Players[i]) then
            return i;
        end
    end
    return 0;
end

return module;