
local PLUGIN = PLUGIN;

function PLUGIN:LockDoors()
	local shopName = self.Config.ApartmentName

	for k, v in pairs(ents.GetAll()) do
		if (Clockwork.entity:IsDoor(v)) then
			local doorName = Clockwork.entity:GetDoorName(v)
			if string.StartWith(doorName, shopName) then
				v:Fire("Lock", "", 0);
			end;
		end;
	end;
end;
