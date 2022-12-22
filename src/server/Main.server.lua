local PartySys = require(script.Parent.PartySystem)

local t = PartySys.new() --Creates Party System

script.Parent.Parent.getPartySystem.OnInvoke = function() --Function to get Party System
    return t;
end