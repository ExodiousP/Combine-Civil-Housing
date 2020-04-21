local PLUGIN = PLUGIN;

local ITEM = Clockwork.item:New("nbitem_base");
ITEM.name = "Apartment Card";
ITEM.cost = 150;
ITEM.model = "models/gibs/metal_gib4.mdl";
ITEM.weight = 0;
ITEM.category = "Other";
ITEM.uniqueID = "apartment_card";
ITEM.business = false;
ITEM.examineOveride = true;
ITEM.description = "This card gives you access to an apartment.";

-- Info stored in the card.
ITEM:AddData("apartment", "N/A", true);

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

function ITEM:GetExamineText(player, itemEntity)
	return "Apartment: " .. (self:GetData("apartment") or "N/A");
end;

--[[
function ITEM:OnOrder(player, ent)

end--]]

if (CLIENT) then
	function ITEM:GetClientSideInfo()
		if (!self:IsInstance()) then return; end;
		local clientInfo = ""

		clientInfo = Clockwork.kernel:AddMarkupLine(clientInfo, "Apartment: " .. (self:GetData("apartment", "N/A") or "N/A")) --TODO

		return (clientInfo != "" and clientInfo);
	end;
end;

ITEM:Register();
