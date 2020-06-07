AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/cpthazama/masseffect3/geth_infiltrator.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
// Can see through walls
ENT.StartHealth = 100
ENT.Shields = 0 -- Shields/Biotic Shields drastically reduce incoming bullet damage, other damages do NOT get reduced
ENT.Armor = 0 -- Reduces all incoming damage, however it is completely useless from biotic damage

ENT.MeleeAttackDamage = 10

	-- ====== File Path Variables ====== --
	-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"vj_masseffect3/geth/legion_foot01.wav","vj_masseffect3/geth/legion_foot02.wav","vj_masseffect3/geth/legion_foot03.wav"}
ENT.SoundTbl_Idle = {"vj_masseffect3/masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307883_m.wav","vj_masseffect3/masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307885_m.wav","vj_masseffect3/masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307886_m.wav","vj_masseffect3/masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307887_m.wav","vj_masseffect3/masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307888_m.wav","vj_masseffect3/masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307889_m.wav","vj_masseffect3/masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307892_m.wav","vj_masseffect3/masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307893_m.wav"}
ENT.SoundTbl_Alert = {"vj_masseffect3/masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307868_m.wav","vj_masseffect3/masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307869_m.wav","vj_masseffect3/masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307870_m.wav","vj_masseffect3/masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307878_m.wav","vj_masseffect3/masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307879_m.wav","vj_masseffect3/masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307880_m.wav","vj_masseffect3/masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307881_m.wav","vj_masseffect3/masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307882_m.wav","vj_masseffect3/masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307895_m.wav","vj_masseffect3/masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307897_m.wav"}
ENT.SoundTbl_Pain = {"vj_masseffect3/masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307871_m.wav","vj_masseffect3/masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307872_m.wav","vj_masseffect3/masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307891_m.wav","vj_masseffect3/masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307894_m.wav","vj_masseffect3/masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307898_m.wav","vj_masseffect3/masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307899_m.wav","vj_masseffect3/masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307899_m.wav","vj_masseffect3/masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307901_m.wav"}
ENT.SoundTbl_Death = {"vj_masseffect3/masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307874_m.wav","vj_masseffect3/masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307875_m.wav","vj_masseffect3/masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307876_m.wav","vj_masseffect3/masseffect3/geth/sfx_ss_geth_trooper_ss_geth_trooper_00307877_m.wav"}
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/