
local PLUGIN = PLUGIN;

PLUGIN.Config = {
	ApartmentName = "Apartment "
}

-- Called when a player attempts to unlock an entity.
function PLUGIN:PlayerCanUnlockEntity(player, entity)
	if (Clockwork.entity:IsDoor(entity)) then
		local DoorName = Clockwork.entity:GetDoorName(entity)
		
		local Number = tonumber( string.sub(DoorName, string.len(DoorName) - 3) )
		print(Number)
		local items = Clockwork.inventory:GetItemsByID(player:GetInventory(), "apartment_card") or {}
		
		for k, v in pairs(items) do
			if v:GetData("apartment") == Number then
				return true
			end
		end

	end;
end;

-- Called when a player attempts to lock an entity.
function PLUGIN:PlayerCanLockEntity(player, entity)
	if (Clockwork.entity:IsDoor(entity)) then
		local DoorName = Clockwork.entity:GetDoorName(entity)
		local Number = tonumber( string.sub(DoorName, string.len(DoorName) - 3) )
		local items = Clockwork.inventory:GetItemsByID(player:GetInventory(), "apartment_card") or {}
		
		for k, v in pairs(items) do
			if v:GetData("apartment") == Number then
				return true
			end
		end
		
	end;
end;

-- Called when a player's character data should be saved.
function PLUGIN:PlayerSaveCharacterData(player, data)
	if ( data["apartment"] ) then
		data["apartment"] = data["apartment"];
	end;
end;

-- Called when a player's character data should be restored.
function PLUGIN:PlayerRestoreCharacterData(player, data)
	data["apartment"] = data["apartment"] or nil;
end;

-- Called when Clockwork has loaded all of the entities.
function PLUGIN:ClockworkInitPostEntity()
	timer.Simple(3, function()
		self:LockDoors();
	end);
end;

