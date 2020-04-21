local COMMAND = Clockwork.command:New("GiveHomeCard")
COMMAND.tip = "Give yourself an apartment card."
COMMAND.text = "<number Apartament>"
COMMAND.flags = CMD_DEFAULT
COMMAND.arguments = 1

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if Schema:PlayerIsCombine(player) or ( player:GetFaction() == FACTION_UBC ) or player:IsAdmin() then
		local app = tonumber(arguments[1])
		if not arguments[1] then
			return
		end

		local item = Clockwork.item:CreateInstance("apartment_card")
		player:GiveItem(item)
		item:SetData("apartment", app)

		Clockwork.player:Notify(player, "You have been given an apartment card.")
	else
		Clockwork.player:Notify(player, "You cannot give yourself an apartment card!")
	end
end

COMMAND:Register()
