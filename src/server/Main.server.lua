local PartySys = require(script.Parent.PartySystem)

local t = PartySys.new()

script.Parent.Parent.getPartySystem.OnInvoke = function()
    return t;
end