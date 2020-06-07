
/*--------------------------------------------------
	=============== Autorun File ===============
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
------------------ Addon Information ------------------
local PublicAddonName = "Mass Effect 3 SNPCs"
local AddonName = "Mass Effect 3"
local AddonType = "SNPC"
local AutorunFile = "autorun/vj_me3_autorun.lua"
-------------------------------------------------------
local VJExists = file.Exists("lua/autorun/vj_base_autorun.lua","GAME")
if VJExists == true then
	include('autorun/vj_controls.lua')

	local vCat = "Mass Effect 3"
	VJ.AddCategoryInfo(vCat,{Icon = "vj_base/icons/masseffect3.png"})
	
	VJ.AddNPC_HUMAN("Geth Trooper","npc_vj_me3_gethtrooper",{"weapon_vj_me3_gethpulserifle"/*,"weapon_vj_me3_gethpulsesniper"*/},vCat) -- Standard
	-- VJ.AddNPC_HUMAN("Geth Hunter","npc_vj_me3_gethhunter",{"weapon_vj_me3_gethpulseshotgun"},vCat) -- Shotgunner, turns invisible
	-- VJ.AddNPC_HUMAN("Geth Infiltrator","npc_vj_me3_gethinfiltrator",{"weapon_vj_me3_wraith"},vCat) -- Fast Shotgunner, sees through walls
	-- VJ.AddNPC_HUMAN("Geth Juggernaut","npc_vj_me3_gethjuggernaut",{"weapon_vj_me3_gethspitfire"},vCat) -- Slow minigunner, zaps enemies, fires plasma projectiles from shoulder, places stationary shields
	VJ.AddNPC_HUMAN("Geth Prime","npc_vj_me3_gethprime",{"weapon_vj_me3_gethpulsecannon"},vCat) -- Slow heavy weapons, summons turrets that follow it, large explosion on death
	-- VJ.AddNPC_HUMAN("Geth Pyro","npc_vj_me3_gethpyro",{"weapon_vj_me3_firestorm"},vCat) -- Slow flamethrower
	-- VJ.AddNPC_HUMAN("Geth Rocket Trooper","npc_vj_me3_gethrockettrooper",{"weapon_vj_me3_gethrocketlauncher"},vCat) -- Basically the Trooper except it fires auto-tracking rockets

	VJ.AddNPCWeapon("VJ_ME3_GethPulseRifle","weapon_vj_me3_gethpulserifle") // Trooper's weapon
	VJ.AddNPCWeapon("VJ_ME3_GethPulseCannon","weapon_vj_me3_gethpulsecannon") // Prime's weapon
	-- VJ.AddNPCWeapon("VJ_ME3_GethPulseShotgun","weapon_vj_me3_gethpulseshotgun") // Hunter's weapon
	-- VJ.AddNPCWeapon("VJ_ME3_GethRocketLauncher","weapon_vj_me3_gethrocketlauncher") // Rocket Launcher's weapon
	-- VJ.AddNPCWeapon("VJ_ME3_GethPulseSniper","weapon_vj_me3_gethpulsesniper") // Trooper's weapon
	-- VJ.AddNPCWeapon("VJ_ME3_GethSpitFire","weapon_vj_me3_gethspitfire") // Juggernaut's weapon
	-- VJ.AddNPCWeapon("VJ_ME3_M-11Wraith","weapon_vj_me3_wraith") // Infiltrator's weapon
	-- VJ.AddNPCWeapon("VJ_ME3_M-451Firestorm","weapon_vj_me3_firestorm") // Pyro's weapon


-- !!!!!! DON'T TOUCH ANYTHING BELOW THIS !!!!!! -------------------------------------------------------------------------------------------------------------------------
	AddCSLuaFile(AutorunFile)
	VJ.AddAddonProperty(AddonName,AddonType)
else
	if (CLIENT) then
		chat.AddText(Color(0,200,200),PublicAddonName,
		Color(0,255,0)," was unable to install, you are missing ",
		Color(255,100,0),"VJ Base!")
	end
	timer.Simple(1,function()
		if not VJF then
			if (CLIENT) then
				VJF = vgui.Create("DFrame")
				VJF:SetTitle("ERROR!")
				VJF:SetSize(790,560)
				VJF:SetPos((ScrW()-VJF:GetWide())/2,(ScrH()-VJF:GetTall())/2)
				VJF:MakePopup()
				VJF.Paint = function()
					draw.RoundedBox(8,0,0,VJF:GetWide(),VJF:GetTall(),Color(200,0,0,150))
				end
				
				local VJURL = vgui.Create("DHTML",VJF)
				VJURL:SetPos(VJF:GetWide()*0.005, VJF:GetTall()*0.03)
				VJURL:Dock(FILL)
				VJURL:SetAllowLua(true)
				VJURL:OpenURL("https://sites.google.com/site/vrejgaming/vjbasemissing")
			elseif (SERVER) then
				timer.Create("VJBASEMissing",5,0,function() print("VJ Base is Missing! Download it from the workshop!") end)
			end
		end
	end)
end